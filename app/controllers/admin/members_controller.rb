class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end 

  def show
    @member = Member.find(params[:id])
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
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_members_path, notice: "Member was successfully updated"
      else
        render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_members_path, notice: "Member successfully deleted"
  end

  private

  def member_params
    params.required(:member).permit(:name, :title, :email, :phone, :address, :bio, :image, :image_cache_id, :remove_image)
  end
end
