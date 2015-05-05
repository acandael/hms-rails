require 'rails_helper'

describe "viewing the news articles" do

  it "shows a listing of news articlesl" do
    article1 = NewsArticle.create!(newsarticle_attributes)
    article2 = NewsArticle.create!(newsarticle_attributes(title: "article2"))
    article3 = NewsArticle.create!(newsarticle_attributes(title: "article3"))

    visit news_articles_path
    expect(page).to have_text article1.title
    expect(page).to have_text "Posted on #{article1.created_at.strftime('%d %B %Y')}"
    expect(page).to have_text article2.title
    expect(page).to have_text "Posted on #{article2.created_at.strftime('%d %B %Y')}"
    expect(page).to have_text article3.title
    expect(page).to have_text "Posted on #{article3.created_at.strftime('%d %B %Y')}"
    
  end
  it "shows the news article details" do
    article = NewsArticle.create!(newsarticle_attributes)
    visit news_articles_path
    click_link article.title

    expect(current_path).to eq(news_article_path(article))
    expect(page).to have_text(article.title)
    expect(page).to have_text(article.body)
    expect(page).to have_selector("img[src$='#{article.image}']")
    expect(page).to have_text(article.link)
    expect(page).to have_text(article.created_at.strftime('%d %B %Y'))
  end
end
