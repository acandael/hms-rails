require 'rails_helper'

describe 'creating a theme' do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'adds a theme to the themes list' do
    visit admin_themes_path
    click_button 'Add Theme'

    fill_in "Title", with: "Stakeholder analysis"
    fill_in "Summary", with: "This is the summary"
    fill_in "Description", with: "This research line aims to chart the organizations"
    click_button "Create Theme"

    expect(page).to have_text "Stakeholder analysis"
    expect(page).to have_text "Theme successfully created"
  end

  it 'does not create a theme with invalid data' do
    visit admin_themes_path
    click_button 'Add Theme'

    fill_in "Title", with: ""
    fill_in "Description", with: "This research line aims to chart the organizations"
    click_button "Create Theme"

    expect(page).to have_text "Title can't be blank"
  end
end
