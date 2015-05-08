require 'rails_helper'

describe 'viewing the members' do
  it 'shows the member details' do
    member = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be", phone: "32 (0)9 264 97 58", title: "Postdoctoral Researcher", address: "Voldersstraat 9, 9000 Ghent Belgium", bio: "Sarah Van Leuven is the postdoctoral research coordinator of Health, Media & Society. She is also a member of the Center for Journalism Studies")

    visit member_path(member)

    expect(page).to have_text member.name
    expect(page).to have_text member.email
    expect(page).to have_text member.phone
    expect(page).to have_text member.address
    expect(page).to have_text member.bio

  end
end
