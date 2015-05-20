require 'rails_helper'

describe 'viewing publications page' do
  it 'shows a list of publications' do
    publication1 = Publication.create!(title: "publication 1", description: "book review")
    publication2 = Publication.create!(title: "publication 2", description: "conference presentation")
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    publication1.members << piet

    theme = Theme.create!(title: "theme 1", description: "description of theme 1")
    publication1.themes << theme

    visit publications_path

    expect(page).to have_text publication1.title
    expect(page).to have_text publication1.description
    expect(page).to have_text publication1.created_at.strftime('%d %B %Y')
    expect(page).to have_text "Piet Bracke"
    expect(page).to have_text publication2.title
    expect(page).to have_text publication2.description
    expect(page).to have_text "theme 1"
  end

  it 'shows the member details when clicked' do
    publication = Publication.create!(title: "publication 1")
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    publication.members << piet

    visit publications_path
    click_link "Piet Bracke"

    expect(current_path).to eq member_path(piet)
  end

  it 'shows the theme details when the title is clicked' do
    publication = Publication.create!(title: "publication 1")
    theme = Theme.create!(title: "theme 1", description: "description of theme 1")
    publication.themes << theme

    visit publications_path
    click_link theme.title

    expect(current_path).to eq theme_path(theme.id)
  end
end
