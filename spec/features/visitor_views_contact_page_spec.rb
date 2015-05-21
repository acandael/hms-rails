require 'rails_helper'

describe 'A visitor visits the contact page' do
  it 'sees the contact details' do
    visit contact_path

    expect(page).to have_css("h1", text: "Contact Us")
  end
end
