class HousesController < ApplicationController
  before_action :load_association
  before_action :authenticate_association_admin!, except: [:index, :show, :edit, :update]
  before_action :can_create!, only: [:new]
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :auth_edit!, only: [:edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = @association.houses.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = @association.houses.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = @association.houses.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def can_create!
    if current_association_admin.residence_association
      if current_association_admin.residence_association.approved
      else
        redirect_to residence_association_url(current_association_admin.residence_association), notice: 'Your registration has not yet been verified'
      end
    else
      redirect_to new_residence_association_url, notice: 'You cannot create house without registering for association'
    end
  end

  def auth_edit!
    if current_association_admin.residence_association != @house.residence_association
      redirect_to houses_url, notice: 'You are not authorized to change this resource'
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = @association.houses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:no, :name, :lat, :lng, :residence_association_id)
    end
end
