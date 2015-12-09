class PublicationsController < ApplicationController
  def index
    @publications = Publication.order(category_id: :desc).order(date: :desc)
  end

  def show
    @publication = Publication.find(params[:id])
  end
end
