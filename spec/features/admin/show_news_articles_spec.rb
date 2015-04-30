require 'rails_helper'

describe "admin views newsarticle" do
  it "sees the newsarticle details" do
    newsarticle = NewsArticle.create!(newsarticle_attributes)
    
    visit admin_news_articles_path
    click_link newsarticle.title

    expect(page).to have_text newsarticle.title
    expect(page).to have_text newsarticle.created_at.strftime('%d %B %Y')
    expect(page).to have_text newsarticle.body
    expect(page).to have_text newsarticle.link
  end
end
