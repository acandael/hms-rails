require 'rails_helper'

describe 'viewing the publications' do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it 'lists the publications' do
    category = Category.create!(name: "presentation")
    publication = Publication.create!(title: "publication 1", category: category)
    visit admin_publications_path
    expect(current_path).to eq admin_publications_path
    expect(page).to have_text publication.title
  end

end
