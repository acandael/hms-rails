class Admin::MembersController < DashboardController
  def index
    @members = Member.all.order(name: :desc)
  end 

  def show
    @member = find_member
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    if @member.save
      redirect_to admin_members_path, notice: "Member created successfully"
    else
      flash[:alert] = @member.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @member = find_member
  end

  def update
    @member = find_member
    if @member.update(member_params)
      redirect_to admin_members_path, notice: "Member was successfully updated"
      else
        render :edit
    end
  end

  def destroy
    @member = find_member
    @member.destroy
    redirect_to admin_members_path, notice: "Member successfully deleted"
  end

  def sort
    params[:member].each_with_index do |id, index|
      Member.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  private
  
  def find_member
    @member = Member.friendly.find(params[:id])
  end
  def member_params
    params.required(:member).permit(:name, :slug, :title, :email, :phone, :address, :bio, :bibliography, :image, :image_cache_id, :remove_image)
  end
end
