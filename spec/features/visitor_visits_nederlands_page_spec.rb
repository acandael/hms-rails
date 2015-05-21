require 'rails_helper'

describe 'A visitor visits the Nederlands-page' do
  it 'shows the Nederlands information' do
    visit nederlands_path

    expect(page).to have_css("h1", text: "De onderzoeksgroep Health, Media & Society")
  end
end
