require 'rails_helper'

describe 'viewing research themes' do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'lists the theme titles' do
    Theme.create!(title: "theme 1")
    Theme.create!(title: "theme 2")

    visit admin_themes_path

    expect(page).to have_text "theme 1"
    expect(page).to have_text "theme 2"
  end
end
