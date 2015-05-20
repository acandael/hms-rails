require 'rails_helper'

describe 'viewing a theme' do
  it 'shows the theme details' do
    theme = Theme.create!(title: "theme 1", description: "description for theme 1")
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    sarah = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be")

    theme.members << piet
    theme.members << sarah

    visit theme_path(theme.id)

    expect(page).to have_text theme.title
    expect(page).to have_text theme.description
    expect(page).to have_text piet.name
    expect(page).to have_text sarah.name
  end
end
