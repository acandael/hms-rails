class Admin::ThemesController < DashboardController
  def index
    @themes = Theme.all.order(title: :asc)
  end

  def show
    @theme = find_theme
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
    @theme = find_theme
  end

  def update
    @update = find_theme
    if @theme.update(theme_params)
      redirect_to admin_themes_path, notice: "Theme successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @theme = find_theme
    @theme.delete
    redirect_to admin_themes_path, notice: "Theme successfully deleted"
  end

  private

  def find_theme
    @theme = Theme.friendly.find(params[:id])
  end

  def theme_params
    params.required(:theme).permit(:title, :slug, :summary, :description, :image, :image_cache_id, :remove_image, :member_ids => [], :publication_ids => [])
  end
end
