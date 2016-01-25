require 'rails_helper'

describe 'editing a publication' do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end
  it 'updates the publication details' do
    reports = Category.create(name: "reports")
    publication = Publication.create!(title: 'publication title', category: reports)
    piet = Member.create!(name: "Piet Bracke", email: "piet.bracke@ugent.be")
    geert = Member.create!(name: "Geert Jacobs", email: "geert.jacobs@ugent.be")
    Theme.create!(title: "theme 1", description: "description 1")
    Theme.create!(title: "theme 2", description: "description 2")

    publication.members << piet 
    publication.members << geert 

    visit admin_publications_path
    click_link 'Edit'

    check "theme 2"
    fill_in "Title", with: "title edited"
    fill_in "Description", with: "book review"
    uncheck "Piet Bracke"
    click_button "Update Publication"

    expect(current_path).to eq admin_publications_path
    expect(page).to have_text 'title edited'
    expect(page).to have_text 'Publication successfully updated'
    expect((Publication.last).description).to eq "book review"
    expect((Publication.last).members.count).to eq 1
    expect((Publication.last).themes.count).to eq 1
  end

  it 'does not update a publication with invalid  data' do
    reports = Category.create(name: "reports")
    publication = Publication.create!(title: 'publication title', category: reports)
    visit admin_publications_path
    click_link 'Edit'

    fill_in "Title", with: ""
    click_button "Update Publication"

    expect(current_path).to eq(admin_publication_path(publication))
    expect(page).to have_text "Title can't be blank"
  end
end
