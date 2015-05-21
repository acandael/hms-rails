require 'rails_helper'

describe NewsArticle do
  it { should validate_presence_of(:title) }
   
  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      news_article = NewsArticle.new(link: link)

      news_article.valid?

      expect(news_article.errors[:link].any?).to eq(false)
    end
  end
   
  it "rejects improperly formated links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      news_article = NewsArticle.new(link: link)

      news_article.valid?

      expect(news_article.errors[:link].any?).to eq(true)
    end
  end
end
