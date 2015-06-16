class PublicationsController < ApplicationController
  def index
    @publications = Publication.all.order(date: :desc)
  end
end
