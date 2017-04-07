class ComplaintsController < ApplicationController

  before_action :load_association
  before_action :authenticate_association_admin!, only: [:index, :destroy]

  def index
    @complaints = current_association_admin.recieved_complaints
  end

  def new

  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.save
    redirect_to request.original_url
  end

  def destroy
    @complaint = Complaint.find(params[:id])
    @complaint.destroy
  end

  private

    def complaint_params
      params.require(:complaint).permit(:content, :sendable_id, :sendable_type, :recipient_id, :recipient_type)
    end
end

