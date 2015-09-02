require 'rails_helper'

describe 'creating a publication' do

  before do
    user = User.create!(user_attributes)

    sign_in(user)
  end

  it 'adds a publication to the publications list' do
   piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
   geert = Member.create!(name: "Geert Jacobs", email: "geert.jacobs@ugent.be")
   visit admin_publications_path
   click_button 'Add Publication'

   fill_in "Date", with: "12 June 2015"
   fill_in "Title", with: "de perfecte storm"
   fill_in "Description", with: "book review"
   fill_in "Summary", with: "this is a summary"
   check piet.name
   check geert.name

   click_button "Create Publication"
  
   expect(page).to have_text 'de perfecte storm' 
   expect((Publication.last).description).to eq 'book review'
   expect((Publication.last).summary).to eq 'this is a summary'
   expect((Publication.last).members.count).to eq 2
   expect((Publication.last).date).to eq "12 June 2015".to_date
  end

  it 'does not save a new publication with invalid data' do
   visit admin_publications_path
   click_button 'Add Publication'

   fill_in "Title", with: ""
   click_button "Create Publication"

   expect(page).to have_text "Title can't be blank"
  end
end
