require 'rails_helper'

describe "Creating a news article" do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it "saves the news article" do
    visit admin_news_articles_path
    click_button "Add News Article"

    fill_in "Date", with: "12 June 2015"
    fill_in "Title", with: "new title"
    fill_in "Body", with: "this is a new article"
    fill_in "Link", with: "http://www.deredactie.be"
    click_button "Create News article"

    expect(current_path).to eq(admin_news_articles_path)
    expect(page).to have_text('The news article was successfully added')
    expect((NewsArticle.last).date).to eq "12 June 2015".to_date
    expect(page).to have_text('new title')
    expect((NewsArticle.last).body).to eq "this is a new article"
    expect((NewsArticle.last).link).to eq "http://www.deredactie.be"
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
