require 'rails_helper'

describe 'viewing a news article' do
  it 'shows the news article details' do
   news_article = NewsArticle.create!(newsarticle_attributes)

   visit news_article_path(news_article)

   expect(page).to have_css 'h1', news_article.title
   expect(page).to have_text news_article.body
   expect(page).to have_text news_article.created_at.strftime('%d %B %Y')
   expect(page).to have_link news_article.link
  end
end
