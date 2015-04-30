require 'rails_helper'

describe "Creating a news article" do
  it "saves the news article" do
    visit admin_news_articles_path
    click_button "Add News Article"

    fill_in "Title", with: "new title"
    fill_in "Body", with: "this is a new article"
    fill_in "Link", with: "http://www.deredactie.be"
    click_button "Create News article"

    expect(current_path).to eq(admin_news_articles_path)
    expect(page).to have_text('The news article was successfully added')
    expect(page).to have_text('new title')

    click_link "new title"

    expect(page).to have_text "this is a new article"
    expect(page).to have_text "http://www.deredactie.be"
  end

  it "does not save a new article with invalid date" do
    visit admin_news_articles_path
    click_button "Add News Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "this is a new article"
    fill_in "Link", with: "http://www.deredactie.be"
    click_button "Create News article"
    expect(page).to have_text("Title can't be blank")
  end
end
