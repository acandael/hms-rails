class Admin::ThemesController < DashboardController
  before_action :find_theme, only: [:show, :edit, :update, :destroy]
  def index
    @themes = Theme.all
  end

  def show
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.create(theme_params)
    if @theme.save
      redirect_to admin_themes_path, notice: "Theme successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @theme.update(theme_params)
      redirect_to admin_themes_path, notice: "Theme successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @theme.delete
    redirect_to admin_themes_path, notice: "Theme successfully deleted"
  end

  private

  def find_theme
    @theme = Theme.friendly.find(params[:id])
  end

  def theme_params
    params.required(:theme).permit(:title, :slug, :summary, :description, :member_ids => [], :publication_ids => [])
  end
end
