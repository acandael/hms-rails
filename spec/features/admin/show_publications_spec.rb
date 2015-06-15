require 'rails_helper'

describe 'Showing a publication' do
  
  let(:user) { User.create!(user_attributes) }

  before do
    sign_in(user)
  end

  it 'shows the publication details' do
    publication = Publication.create!(title: "de perfecte storm", description: "book review")
    member1 = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    member2 = Member.create!(name: "Geert Jacobs", email: "geert.jacobs@ugent.be")
    theme = Theme.create!(title: "theme 1", description: "description of theme 1")
    publication.themes << theme
    publication.members << member1
    publication.members << member2
    publication.save

    visit admin_publication_path(publication)

    expect(page).to have_text "de perfecte storm"
    expect(page).to have_text "book review"
    expect(page).to have_text publication.created_at.strftime('%d %B %Y')
    expect(page).to have_text "Piet Bracke"
    expect(page).to have_text "Geert Jacobs"
    expect(page).to have_text "theme 1"

    click_link "theme 1"
    expect(current_path).to eq admin_theme_path(theme.friendly_id)
  end
end
