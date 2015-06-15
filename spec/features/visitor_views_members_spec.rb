require 'rails_helper'

describe 'viewing the members' do
  it 'shows a list with members' do
    member1 = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be", title: "Postdoctoral Researcher")
    member2 = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be", title: "Professor")
    member3 = Member.create!(name: "Geert Jacobs", email: "geert.jacobs@ugent.be", title: "Professor")

    visit people_path

    expect(page).to have_text member1.name
    expect(page).to have_text member1.title
    expect(page).to have_text member2.name
    expect(page).to have_text member2.title
    expect(page).to have_text member3.name
    expect(page).to have_text member3.title
  end

  it 'shows the member details when clicked' do
    member = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be", title: "Postdoctoral Researcher")

    visit people_path
    click_link member.name

    expect(current_path).to eq member_path(member.friendly_id)
  end
end
