require 'rails_helper'

describe 'editing a publication' do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end
  it 'updates the publication details' do
    Publication.create!(title: 'publication title')
    visit admin_publications_path
    click_link 'Edit'

    fill_in "Title", with: "title edited"
    click_button "Update Publication"

    expect(current_path).to eq admin_publications_path
    expect(page).to have_text 'title edited'
    expect(page).to have_text 'Publication successfully updated'
  end

  it 'does not update a publication with invalid  data' do
    publication = Publication.create!(title: 'publication title')
    visit admin_publications_path
    click_link 'Edit'

    fill_in "Title", with: ""
    click_button "Update Publication"

    expect(current_path).to eq(admin_publication_path(publication))
    expect(page).to have_text "Title can't be blank"
  end
end
