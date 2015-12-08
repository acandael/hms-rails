require 'rails_helper'

describe 'showing a theme' do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'shows the theme details' do
    theme = Theme.create!(title: "Stakeholder analysis", summary: "This is the summary", description: "This research line aims to chart the organizations")

    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    sarah = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be")
    pub1 = Publication.create!(title: "publication 1", description: "description of pub 1")
    pub2 = Publication.create!(title: "publication 2", description: "description of pub 2")
    
    theme.members << piet
    theme.members << sarah
    theme.publications << pub1
    theme.publications << pub2

    visit admin_theme_path(theme)

    expect(page).to have_text 'Stakeholder analysis'
    expect(page).to have_text 'This is the summary'
    expect(page).to have_text 'This research line aims to chart the organizations'
    expect(page).to have_text piet.name
    expect(page).to have_text sarah.name
    expect(page).to have_text pub1.title
    expect(page).to have_text pub2.title
  end
end
