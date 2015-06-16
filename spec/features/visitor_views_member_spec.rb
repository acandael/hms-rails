require 'rails_helper'

describe 'viewing a member' do
  let(:member) { Member.create!(member_attributes) }
  let(:theme) { Theme.create!(theme_attributes) }
  let(:publication) { Publication.create!(publication_attributes) }
  before do
    member.themes << theme
    member.publications << publication
    visit member_path(member)
  end

  it 'shows the member details' do
    expect(page).to have_text member.name
    expect(page).to have_text member.email
    expect(page).to have_text member.phone
    expect(page).to have_text member.address
    expect(page).to have_text member.bio
    expect(page).to have_text member.bibliography

  end

  it 'goes to the theme when clicked' do
    click_link theme.title
    
    expect(current_path).to eq theme_path(theme.friendly_id)
  end

  it 'shows the member publications' do
    expect(page).to have_text publication.title
  end
end
