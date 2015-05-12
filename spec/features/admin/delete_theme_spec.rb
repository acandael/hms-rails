require 'rails_helper'

describe 'deleting a theme' do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'does not show the theme in the list' do
    Theme.create!(title: "Stakeholder analysis", description: "this is the description")

    visit admin_themes_path
    click_link "Delete"

    expect(page).not_to have_text "Stakeholder analysis"
    expect(page).to have_text "Theme successfully deleted"
  end
end
