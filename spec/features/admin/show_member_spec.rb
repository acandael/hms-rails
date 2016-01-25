require 'rails_helper'

describe 'Showing a member' do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it 'shows the member details' do
    member = Member.create!(name: "Piet Bracke", title: "Professor",  email: "piet.bracke@ugent.be", phone: "32 (0)9 264 68 64", address: "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)", bio: "Piet Bracke is a full professor at the Department of Sociology at Ghent University")

    report = Category.create(name: "report")
    publication = Publication.create!(title: "publication 1", category: report)
    member.publications << publication
    member.save

    visit admin_members_path
    click_link member.name

    expect(page).to have_text member.name
    expect(page).to have_text member.title
    expect(page).to have_text member.email
    expect(page).to have_text member.phone
    expect(page).to have_text member.address
    expect(page).to have_text member.bio
    expect(page).to have_text "publication 1"
  end
end
