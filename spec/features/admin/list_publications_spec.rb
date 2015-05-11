require 'rails_helper'

describe 'viewing the publications' do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it 'lists the publications' do
    publication = Publication.create!(title: "publication 1")
    visit admin_publications_path
    expect(current_path).to eq admin_publications_path
    expect(page).to have_text publication.title
  end
end
