require 'rails_helper'

feature 'Admin interacts with news' do
  scenario 'and sees news articles' do
    NewsArticle.create!(title: "newsarticle1")
    NewsArticle.create!(title: "newsarticle2")
    visit admin_news_articles_path

    expect(page).to have_text "newsarticle1"
    expect(page).to have_text "newsarticle2"
  end
end
