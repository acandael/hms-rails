require 'rails_helper'

describe 'viewing publications page' do
  it 'shows a list of publications' do
    publication1 = Publication.create!(date: "12 june 2015".to_date, title: "publication 1", description: "book review", summary: "this is the summary")
    publication2 = Publication.create!(date: "13 june 2015".to_date, title: "publication 2", description: "conference presentation", summary: "this is the summary")
    author = Member.create!(member_attributes)
    publication1.members << author

    theme = Theme.create!(theme_attributes)
    publication1.themes << theme

    visit publications_path

    expect(page).to have_css 'h1', text:  publication1.title
    expect(page).to have_text publication1.description
    expect(page).to have_text publication1.summary
    expect(page).to have_css 'p.date', publication1.date.strftime('%d %B %Y')
    expect(page).to have_css 'p.authors',  author.name
    expect(page).to have_css 'h1', publication2.title
    expect(page).to have_text publication2.description
    expect(page).to have_link theme.title
  end

  it 'shows the member details when clicked' do
    publication = Publication.create!(publication_attributes)
    author = Member.create!(member_attributes)
    publication.members << author

    visit publications_path
    click_link author.name

    expect(current_path).to eq member_path(author)
  end

  it 'shows the theme details when the title is clicked' do
    publication = Publication.create!(publication_attributes)
    theme = Theme.create!(theme_attributes)
    publication.themes << theme

    visit publications_path
    click_link theme.title

    expect(current_path).to eq theme_path(theme.friendly_id)
  end
end
