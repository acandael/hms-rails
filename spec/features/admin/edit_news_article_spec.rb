require 'rails_helper'

describe "Editing a news article" do
  it "updates the news article" do
    article = NewsArticle.create!(newsarticle_attributes)
    visit admin_news_articles_path
    click_link 'Edit'

    fill_in "Title", with: "edited title"
    fill_in "Body", with: "edited bodytext"
    fill_in "Link", with: "http://www.edited.com"
    click_button "Update News article"

    article.reload

    expect(current_path).to eq(admin_news_articles_path)
    expect(article.title).to eq("edited title")
    expect(article.body).to eq("edited bodytext")
    expect(article.link).to eq("http://www.edited.com")
  end

  it "does not update the news article with invalid data" do
    NewsArticle.create!(newsarticle_attributes)
    visit admin_news_articles_path
    click_link 'Edit'

    fill_in "Title", with: ""
    fill_in "Body", with: "edited bodytext"
    fill_in "Link", with: "http://www.edited.com"
    click_button "Update News article"

    expect(page).to have_text "Title can't be blank"
  end
end
