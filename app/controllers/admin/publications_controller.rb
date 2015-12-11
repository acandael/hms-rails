class Admin::PublicationsController < DashboardController
  def index
    if (category_selected?)
      @publications = Publication.filter_by_category(params[:publication][:category])
      @selected = params[:publication].try(:[], :category)
    else
      @publications = Publication.all.order("created_at asc")
    end
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.create(publication_params)
    if @publication.save
      redirect_to admin_publications_path
    else
      render :new
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to admin_publications_path, notice: "Publication successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.delete
    redirect_to admin_publications_path, notice: "Publication successfully deleted"
  end

  private

  def publication_params
    params.required(:publication).permit(:date, :year, :title, :category_id, :description, :summary, :link, :document, :remove_document, :theme_ids => [], :member_ids => [])
  end

  def category_selected?
    params.has_key?(:publication) && (params[:publication][:category] != "")
  end
end
