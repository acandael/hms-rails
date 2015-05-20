require 'rails_helper'

describe 'viewing a member' do
  it 'shows the member details' do
    member = Member.create!(name: "Sarah Van Leuven", email: "sarah.vanleuven@ugent.be", phone: "32 (0)9 264 97 58", title: "Postdoctoral Researcher", address: "Voldersstraat 9, 9000 Ghent Belgium", bio: "Sarah Van Leuven is the postdoctoral research coordinator of Health, Media & Society. She is also a member of the Center for Journalism Studies")

    theme = Theme.create!(title: "theme 1", description: "description for theme 1")
    member.themes << theme

    visit member_path(member)

    expect(page).to have_text member.name
    expect(page).to have_text member.email
    expect(page).to have_text member.phone
    expect(page).to have_text member.address
    expect(page).to have_text member.bio

    click_link theme.title
    
    expect(current_path).to eq theme_path(theme.id)
  end
end
