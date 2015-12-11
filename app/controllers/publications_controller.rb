class PublicationsController < ApplicationController
  def index
    @publications = Publication.order(category_id: :desc).order(date: :desc)
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def sort
    @category = Category.find_by_name(params[:category])
    @publications = Publication.sort_by_category(@category.id).grouped_by_year
  end
end
