require 'rails_helper'

describe 'editing a member' do
  it 'shows the updated member data' do
    member = Member.create!(name: "Piet Bracke", title: "Professor", email: "piet.bracke@ugent.be", phone: "32 (0)9 264 68 64", address: "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)", bio: "Piet Bracke is a full professor at the Department of Sociology at Ghent University")

    visit admin_members_path
    click_link "Edit"

    fill_in "Name", with: "Johan Bracke"
    fill_in "Title", with: "Postdoctoral Researcher"
    fill_in "Email", with: "johan.bracke@ugent.be"
    click_button "Update Member"

    member.reload

    expect(page).to have_text "Johan Bracke"
    expect(page).to have_text "Member was successfully updated"
    expect(member.title).to eq "Postdoctoral Researcher"
    expect(member.email).to eq "johan.bracke@ugent.be"
  end

  it 'does not update a member with invalid data' do
    member = Member.create!(name: "Piet Bracke", title: "Postdoctoral Researcher", email: "piet.bracke@ugent.be", phone: "32 (0)9 264 68 64", address: "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)", bio: "Piet Bracke is a full professor at the Department of Sociology at Ghent University")

    visit admin_members_path
    click_link "Edit"

    fill_in "Name", with: "Johan Bracke"
    fill_in "Email", with: ""
    click_button "Update Member"

    member.reload

    expect(member.name).not_to eq "Johan Brack"
    expect(page).to have_text "Email can't be blank"
  end
end
