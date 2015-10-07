require 'rails_helper'

describe 'Showing a publication' do
  
  let(:user) { User.create!(user_attributes) }

  before do
    sign_in(user)
  end

  it 'shows the publication details' do
    publication = Publication.create!(publication_attributes)
    member1 = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    member2 = Member.create!(name: "Geert Jacobs", email: "geert.jacobs@ugent.be")
    theme = Theme.create!(title: "theme 1", description: "description of theme 1")
    publication.themes << theme
    publication.members << member1
    publication.members << member2
    publication.summary = "this is a summary"
    publication.link = "http://www.ugent.be/ps"
    publication.save

    visit admin_publication_path(publication)

    expect(page).to have_text publication.title
    expect(page).to have_text publication.description
    expect(page).to have_text publication.date.strftime('%d %B %Y')
    expect(page).to have_text "Piet Bracke"
    expect(page).to have_text "Geert Jacobs"
    expect(page).to have_text "theme 1"
    expect(page).to have_text "this is a summary"
    expect(page).to have_text "http://www.ugent.be/ps"

    click_link "theme 1"
    expect(current_path).to eq admin_theme_path(theme.friendly_id)
  end
end
