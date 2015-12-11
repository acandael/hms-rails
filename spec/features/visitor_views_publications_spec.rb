require 'rails_helper'

describe 'viewing publications page' do
  let(:category) { Category.create!(name: "presentation") }
  let!(:publication1) { Publication.create!(date: "12 june 2015".to_date, title: "publication 1", category_id: category.id) }
  let!(:publication2) { Publication.create!(date: "13 june 2015".to_date, title: "publication 2", category_id: category.id) }
  it 'shows a list of publications' do
    visit output_path

    expect(page).to have_content publication1.title
    expect(page).to have_content publication2.title
  end

  it 'shows a subtitle for every year' do
    visit output_path
    click_link "all publications for #{category.name}"

    expect(page).to have_css 'h2', text: publication1.year 
    expect(page).to have_css 'h2', text: publication2.year 
  end

end
