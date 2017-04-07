class MembersController < ApplicationController
  before_action :load_association
  before_action :authenticate_association_admin!, only: [:destroy]
  before_action :correct_association_admin, only: [:destroy]
  def index
    @members = @association.members
  end

  def show
    @member = @association.members.find(params[:id])
  end

  def destroy
    @member = @association.members.find(params[:id])
    @member.destroy
  end

  private
  def correct_association_admin
    if @member.residence.association_admin == current_association_admin
    else
      redirect_to root_url, notice: 'You dont have access to do that'
    end
  end
end
