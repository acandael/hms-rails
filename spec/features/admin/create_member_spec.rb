require 'rails_helper'

feature 'Creating a member' do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it 'shows a new member and displays a success message' do
    visit admin_members_path
    click_button 'Add Member'

    fill_in "Name", with: "Piet Bracke"
    fill_in "Title", with: "Professor"
    fill_in "Email", with: "piet.bracke@ugent.be"
    fill_in "Phone", with: "32 (0)9 264 68 64"
    fill_in "Address", with: "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)"
    fill_in "Bio", with: "Piet Bracke is a full professor at the Department of Sociology at Ghent University"
    fill_in "Bibliography", with: "https://biblio.ugent.be/publication?q=%22sarah+van+leuven%22"
    click_button "Create Member"

    expect(page).to have_text "Member created successfully"
    expect(page).to have_text "Piet Bracke"
    expect((Member.last).title).to eq "Professor"
    expect((Member.last).email).to eq "piet.bracke@ugent.be"
    expect((Member.last).phone).to eq "32 (0)9 264 68 64"
    expect((Member.last).address).to eq "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)"
    expect((Member.last).bio).to eq "Piet Bracke is a full professor at the Department of Sociology at Ghent University"
    expect((Member.last).bibliography).to eq "https://biblio.ugent.be/publication?q=%22sarah+van+leuven%22"
  end

  it 'does not save a member with invalid data' do
    visit admin_members_path
    click_button 'Add Member'

    fill_in "Name", with: ""
    fill_in "Title", with: "Professor"
    fill_in "Email", with: "piet.bracke@ugent.be"
    fill_in "Phone", with: "32 (0)9 264 68 64"
    fill_in "Address", with: "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)"
    fill_in "Bio", with: "Piet Bracke is a full professor at the Department of Sociology at Ghent University"
    click_button "Create Member"

    expect(page).to have_text "Name can't be blank"
  end
end
