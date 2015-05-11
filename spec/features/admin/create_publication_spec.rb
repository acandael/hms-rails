require 'rails_helper'

describe 'creating a publication' do

  before do
    user = User.create!(user_attributes)

    sign_in(user)
  end

  it 'adds a publication to the publications list' do
   visit admin_publications_path
   click_button 'Add Publication'

   fill_in "Title", with: "publication 1"
   click_button "Create Publication"

   expect(page).to have_text 'publication 1' 
  end

  it 'does not save a new publication with invalid data' do
   visit admin_publications_path
   click_button 'Add Publication'

   fill_in "Title", with: ""
   click_button "Create Publication"

   expect(page).to have_text "Title can't be blank"
  end
end
