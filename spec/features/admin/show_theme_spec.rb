require 'rails_helper'

describe 'showing a theme' do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'shows the theme details' do
    theme = Theme.create!(title: "Stakeholder analysis", description: "This research line aims to chart the organizations")

    visit admin_theme_path(theme)

    expect(page).to have_text 'Stakeholder analysis'
    expect(page).to have_text 'This research line aims to chart the organizations'
  end
end
