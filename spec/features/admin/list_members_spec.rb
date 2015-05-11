require 'rails_helper'

describe "Viewing the members" do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it "shows a list of members" do
    member1 = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be")
    member2 = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    member3 = Member.create!(name: "Geert Jacobs", email: "geert.jacobs@ugent.be")

    visit admin_members_path

    expect(page).to have_text member1.name
    expect(page).to have_text member2.name
    expect(page).to have_text member3.name
  end
end
