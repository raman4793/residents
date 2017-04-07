class ResidenceAssociationsController < ApplicationController
  before_action :load_association, only: [:show]
  before_action :authenticate_association_admin!, except: [:index, :show, :edit, :update]
  before_action :set_residence_association, only: [:show, :edit, :update, :destroy]
  before_action :check_create, only: [:new, :create]
  before_action :auth_edit!, only: [:edit, :update, :destroy]

  # GET /residence_associations
  # GET /residence_associations.json
  def index
    @residence_associations = ResidenceAssociation.all
  end

  # GET /residence_associations/1
  # GET /residence_associations/1.json
  def show
    @residence_association = @association
  end

  # GET /residence_associations/new
  def new
    @residence_association = ResidenceAssociation.new
  end

  # GET /residence_associations/1/edit
  def edit
  end

  # POST /residence_associations
  # POST /residence_associations.json
  def create
    @residence_association = ResidenceAssociation.new(residence_association_params)
    @residence_association.association_admin = current_association_admin
    respond_to do |format|
      if @residence_association.save
        format.html { redirect_to @residence_association, subdomain: @residence_association.subdomain, notice: 'Residence association was successfully created.' }
        format.json { render :show, status: :created, location: @residence_association }
      else
        format.html { render :new }
        format.json { render json: @residence_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residence_associations/1
  # PATCH/PUT /residence_associations/1.json
  def update
    respond_to do |format|
      if @residence_association.update(residence_association_params)
        format.html { redirect_to @residence_association, notice: 'Residence association was successfully updated.' }
        format.json { render :show, status: :ok, location: @residence_association }
      else
        format.html { render :edit }
        format.json { render json: @residence_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residence_associations/1
  # DELETE /residence_associations/1.json
  def destroy
    @residence_association.destroy
    respond_to do |format|
      format.html { redirect_to residence_associations_url, notice: 'Residence association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def check_create
    if current_association_admin.residence_association
      redirect_to residence_associations_url, notice: 'You already have a residence association'
    end
  end

  def auth_edit!
    puts("Admin Signed In #{current_admin}")
    if admin_signed_in?
      puts("Admin Signed In #{current_admin}")
      true
    elsif association_admin_signed_in?
      if current_association_admin.residence_association != @residence_association
        redirect_to residence_associations_url, notice: 'You dont have the privilages to edit this resource'
      end

    elsif member_signed_in?
      redirect_to houses_url, notice: 'You dont have sufficient privilages to access that resource'
    else
      redirect_to new_association_admin_session_path, notice: 'Login to continue'
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_residence_association
      @residence_association = ResidenceAssociation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residence_association_params
      params.require(:residence_association).permit(:name, :lat, :lng, :association_admin_id, :approved, :subdomain, :logo)
    end
end
