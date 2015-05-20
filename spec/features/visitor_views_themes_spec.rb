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

    expect(page).to have_text theme1.title
    expect(page).to have_text theme1.description
    expect(page).to have_text theme2.title
    expect(page).to have_text theme2.description
    expect(page).to have_text "Piet Bracke"
    expect(page).to have_text "Sarah Van Leuven"

  end

  it 'goes to the theme page when a theme title is clicked' do
    theme1 = Theme.create!(title: "theme 1", description: "description for theme 1")
    visit themes_path
    click_link theme1.title

    expect(current_path).to eq theme_path(theme1.id)
  end

  it 'goes to the member page when a member name is clicked' do
    theme1 = Theme.create!(title: "theme 1", description: "description for theme 1")
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")

    theme1.members << piet

    visit themes_path
    click_link piet.name

    expect(current_path).to eq member_path(piet.id)
  end
end
