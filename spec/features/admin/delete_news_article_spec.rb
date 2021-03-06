require 'rails_helper'

describe "Deleting news article" do

  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end

  it "deletes the news article from the list" do
    article = NewsArticle.create!(newsarticle_attributes)
    visit admin_news_articles_path
    click_link "Delete"

    expect(page).not_to have_text article.title
    expect(page).to have_text "News article successfully deleted"
  end
end
