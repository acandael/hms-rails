require 'rails_helper'

describe 'viewing a publication' do
  it 'shows the publication details' do
    category = Category.create!(name: "presentation")
    publication = Publication.create!(date: "12 june 2015".to_date, title: "publication 1", category_id: category.id, description: "book review", summary: "this is the summary", link: "http://www.ugent.be/ps")

    author = Member.create!(member_attributes)
    publication.members << author


    theme = Theme.create!(theme_attributes)
    publication.themes << theme

    visit publication_path(publication.id)

    expect(page).to have_css 'h1', text:  publication.title
    expect(page).to have_text publication.description
    expect(page).to have_text publication.summary
    expect(page).to have_text publication.link
    expect(page).to have_css 'p.date', publication.date.strftime('%d %B %Y')
    expect(page).to have_css 'p.authors',  author.name
  end
end
