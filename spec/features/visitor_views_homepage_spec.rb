require 'rails_helper'

describe "viewing the homepage" do
  let!(:article1) { NewsArticle.create!(newsarticle_attributes(title: "article1")) }
  let!(:article2) { NewsArticle.create!(newsarticle_attributes(title: "article2")) }
  let!(:article3) { NewsArticle.create!(newsarticle_attributes(title: "article3")) }
  
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
end
