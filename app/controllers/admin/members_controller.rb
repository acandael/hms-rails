class Admin::MembersController < DashboardController
  before_action :find_member, only: [:show, :edit, :update, :destroy]
  def index
    @members = Member.all
  end 

  def show
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
  end

  def update
    if @member.update(member_params)
      redirect_to admin_members_path, notice: "Member was successfully updated"
      else
        render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to admin_members_path, notice: "Member successfully deleted"
  end

  private
  
  def find_member
    @member = Member.friendly.find(params[:id])
  end
  def member_params
    params.required(:member).permit(:name, :slug, :title, :email, :phone, :address, :bio, :bibliography, :image, :image_cache_id, :remove_image)
  end
end
