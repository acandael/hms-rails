class Admin::ThemesController < DashboardController
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
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
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      redirect_to admin_themes_path, notice: "Theme successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.delete
    redirect_to admin_themes_path, notice: "Theme successfully deleted"
  end

  private

  def theme_params
    params.required(:theme).permit(:title, :description, :member_ids => [], :publication_ids => [])
  end
end
