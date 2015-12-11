class MembersController < ApplicationController
  def index
    @members = Member.order_by_position
  end

  def show
    @member = Member.friendly.find(params[:id])
  end
end
