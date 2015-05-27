require 'rails_helper'

describe 'viewing a theme' do

  let(:theme) { Theme.create(theme_attributes) }

  it 'shows the theme details' do
    visit theme_path(theme)

    expect(page).to have_css 'h1', text: theme.title
    expect(page).to have_text theme.description
  end

  it "it shows the theme's researchers" do
    researcher1 = Member.create!(member_attributes(name: "Piet Bracke", email: 'piet.bracke@ugent.be'))
    researcher2 = Member.create!(member_attributes(name: 'Sarah Van Leuven', email: 'sarah.vanleuven@ugent.be'))

    theme.members << researcher1
    theme.members << researcher2

    visit theme_path(theme)

    expect(page).to have_css 'li', text: researcher1.name
    expect(page).to have_css 'li', text: researcher2.name
  end

  it "goes to a theme's researcher details when clicked" do
    researcher = Member.create!(member_attributes(name: "Piet Bracke", email: 'piet.bracke@ugent.be'))

    theme.members << researcher

    visit theme_path(theme)

    click_link researcher.name

    expect(current_path).to eq member_path(researcher)
  end

  it "shows the theme's publications" do
    publication = Publication.create(publication_attributes)
    theme.publications << publication

    visit theme_path(theme)

    expect(page).to have_text publication.title
  end
end
