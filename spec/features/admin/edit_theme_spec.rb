require 'rails_helper'

describe 'Editing a theme' do
  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it 'updates the theme' do
    theme = Theme.create!(title: "Stakeholder analysis", description: "This research line aims to chart the organizations")
    visit admin_themes_path
    click_link 'Edit'

    fill_in "Title", with: "Stakeholder report"
    fill_in "Description", with: "This research aims to chart the stakeholders"
    click_button "Update Theme"

    theme.reload

    expect(current_path).to eq(admin_themes_path)
    expect(theme.title).to eq "Stakeholder report"
    expect(theme.description).to eq "This research aims to chart the stakeholders"
    expect(page).to have_text "Theme successfully updated"
  end

  it 'does not update a theme with invalid data' do
    theme = Theme.create!(title: "Stakeholder analysis", description: "This research line aims to chart the organizations")

    visit admin_themes_path
    click_link 'Edit'

    fill_in "Title", with: ""
    fill_in "Description", with: "This research aims to chart the stakeholders"
    click_button "Update Theme"

    theme.reload

    expect(theme.description).not_to eq "This research aims to chart the stakeholders"
    expect(page).to have_text "Title can't be blank"
  end
end
