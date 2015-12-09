require 'rails_helper'

describe 'viewing publications page' do
  it 'shows a list of publications' do
    category = Category.create!(name: "presentation")
    publication1 = Publication.create!(date: "12 june 2015".to_date, title: "publication 1", category_id: category.id)
    publication2 = Publication.create!(date: "13 june 2015".to_date, title: "publication 2", category_id: category.id)

    visit publications_path

    expect(page).to have_content publication1.title
    expect(page).to have_content publication2.title
  end

end
