require 'rails_helper'

describe 'viewing a theme' do
  it 'shows the theme details' do
    theme = Theme.create!(title: "theme 1", description: "description for theme 1")
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    sarah = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be")
    publication = Publication.new(title: "publication 1")


    theme.members << piet
    theme.members << sarah
    theme.publications << publication

    visit theme_path(theme.id)

    expect(page).to have_text theme.title
    expect(page).to have_text theme.description
    expect(page).to have_text piet.name
    expect(page).to have_text sarah.name
    expect(page).to have_text publication.title

    click_link piet.name
    
    expect(current_path).to eq(member_path(piet.id))
  end
end
