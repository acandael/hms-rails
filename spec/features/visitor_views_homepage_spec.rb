require 'rails_helper'

describe "viewing the homepage" do
  let!(:article1) { NewsArticle.create!(newsarticle_attributes(title: "article1")) }
  let!(:article2) { NewsArticle.create!(newsarticle_attributes(title: "article2")) }
  let!(:article3) { NewsArticle.create!(newsarticle_attributes(title: "article3")) }
  let!(:theme1) { Theme.create!(title: "theme 1", summary: "summary for theme 1") }
  let!(:theme2) { Theme.create!(title: "theme 2", summary: "summary for theme 2") } 
  
  before do
    visit root_path
  end

  it "shows the two most recent articles" do
    article3.created_at= 1.month.from_now
    article2.created_at= 2.month.from_now
    article1.created_at= 3.month.from_now

    article3.save
    article2.save
    article1.save

    expect(page).not_to have_text article1.title
    expect(page).to have_text article2.title
    expect(page).to have_text article2.body[0..90]
    expect(page).to have_text article3.title
    expect(page).to have_text article3.body[0..90]
  end

  it 'shows the news article when clicked' do
    click_link article2.title

    expect(current_path).to eq news_article_path(article2.friendly_id)
  end

  it 'shows the themes' do
    expect(page).to have_text theme1.title
    expect(page).to have_text theme1.summary
    expect(page).to have_text theme2.title
    expect(page).to have_text theme2.summary
  end

  it 'shows the theme when clicked' do
    click_link theme1.title

    expect(current_path).to eq theme_path(theme1.friendly_id)
  end
end
