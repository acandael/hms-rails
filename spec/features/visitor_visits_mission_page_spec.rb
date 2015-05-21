require 'rails_helper'

describe 'A visitor visits the mission page' do
  it 'shows the mission content' do
    visit mission_path

    expect(page).to have_css("h1", text: "Mission")
  end
end
