require 'rails_helper'

describe 'viewing the themes' do
  it 'shows a list with themes' do
    theme1 = Theme.create!(title: "theme 1", description: "description for theme 1")
    theme2 = Theme.create!(title: "theme 2", description: "description for theme 2")

    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    sarah = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be")

    theme1.members << piet
    theme1.members << sarah

    visit themes_path

    expect(page).to have_css 'h2', text: theme1.title
    expect(page).to have_text theme1.description
    expect(page).to have_css 'h2', text: theme2.title
    expect(page).to have_text theme2.description
    expect(page).to have_css 'li', text: "Piet Bracke"
    expect(page).to have_css 'li', text: "Sarah Van Leuven"

  end

  it 'goes to the theme page when a theme title is clicked' do
    theme = Theme.create!(theme_attributes)
    visit themes_path
    click_link theme.title

    expect(current_path).to eq theme_path(theme.friendly_id)
  end

  it 'goes to the member page when a member name is clicked' do
    report = Category.create(name: "report")
    publication = Publication.create(title: "some publication", category: report)
    theme = Theme.create!(theme_attributes)
    theme.publications << publication
    theme.save
    researcher = Member.create!(member_attributes)


    theme.members << researcher

    visit themes_path
    click_link researcher.name

    expect(current_path).to eq member_path(researcher)
  end
end
