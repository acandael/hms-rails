require 'rails_helper'

feature 'Admin interacts with news' do
  let(:user) { User.create!(user_attributes) } 

  before do
    sign_in(user)
  end
  scenario 'and sees news articles' do
    NewsArticle.create!(newsarticle_attributes(title: "article1"))
    NewsArticle.create!(newsarticle_attributes(title: "article2"))
    visit admin_news_articles_path

    expect(page).to have_text "article1"
    expect(page).to have_text "article2"
  end
end
