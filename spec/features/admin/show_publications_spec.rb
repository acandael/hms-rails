require 'rails_helper'

describe 'Showing a publication' do
  
  let(:user) { User.create!(user_attributes) }

  before do
    sign_in(user)
  end

  it 'shows the publication details' do
    publication = Publication.create!(title: "publication 1")
    member1 = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    member2 = Member.create!(name: "Geert Jacobs", email: "geert.jacobs@ugent.be")
    publication.members << member1
    publication.members << member2
    publication.save

    visit admin_publication_path(publication)

    expect(page).to have_text "publication 1"
    expect(page).to have_text publication.created_at.strftime('%d %B %Y')
    expect(page).to have_text "Piet Bracke"
    expect(page).to have_text "Geert Jacobs"
  end
end
