class ThemesController < ApplicationController
  def index
    @themes = Theme.includes(:members).all.order(title: :desc)
  end

  def show
    @theme = Theme.friendly.find(params[:id])
  end
end
