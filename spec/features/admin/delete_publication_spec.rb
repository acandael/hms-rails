require 'rails_helper'

describe 'deleting a publication' do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'does not show the publication in the publication list' do
    Publication.create!(title: 'publication 1')
    visit admin_publications_path

    click_link 'Delete'

    expect(page).not_to have_text 'publication 1'
    expect(page).to have_text 'Publication successfully deleted'
  end
end
