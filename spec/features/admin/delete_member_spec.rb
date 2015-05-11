require 'rails_helper'

describe 'deleting a member' do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it 'removes the member from the member list' do
    Member.create!(name: "Piet Bracke", title: "Professor", email: "piet.bracke@ugent.be", phone: "32 (0)9 264 68 64", address: "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)", bio: "Piet Bracke is a full professor at the Department of Sociology at Ghent University")

    visit admin_members_path
    click_link "Delete"

    expect(page).not_to have_text "Piet Bracke"
    expect(page).to have_text "Member successfully deleted"
  end
end
