require 'rails_helper'

describe 'viewing publications page' do
  it 'shows a list of publications' do
    publication1 = Publication.create!(title: "publication 1")
    publication2 = Publication.create!(title: "publication 2")
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    publication1.members << piet

    visit publications_path

    expect(page).to have_text publication1.title
    expect(page).to have_text publication1.created_at.strftime('%d %B %Y')
    expect(page).to have_text "Piet Bracke"
    expect(page).to have_text publication2.title
  end

  it 'shows the member details when clicked' do
    publication = Publication.create!(title: "publication 1")
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    publication.members << piet

    visit publications_path
    click_link "Piet Bracke"

    expect(current_path).to eq member_path(piet)
  end
end
