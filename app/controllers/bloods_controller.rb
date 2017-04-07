class BloodsController < ApplicationController
  before_action :set_blood, only: [:show, :edit, :update, :destroy]

  # GET /bloods
  # GET /bloods.json
  def index
    @bloods = Blood.all
  end

  # GET /bloods/1
  # GET /bloods/1.json
  def show
  end

  # GET /bloods/new
  def new
    @blood = Blood.new
  end

  # GET /bloods/1/edit
  def edit
  end

  # POST /bloods
  # POST /bloods.json
  def create
    @blood = Blood.new(blood_params)

    respond_to do |format|
      if @blood.save
        format.html { redirect_to @blood, notice: 'Blood was successfully created.' }
        format.json { render :show, status: :created, location: @blood }
      else
        format.html { render :new }
        format.json { render json: @blood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bloods/1
  # PATCH/PUT /bloods/1.json
  def update
    respond_to do |format|
      if @blood.update(blood_params)
        format.html { redirect_to @blood, notice: 'Blood was successfully updated.' }
        format.json { render :show, status: :ok, location: @blood }
      else
        format.html { render :edit }
        format.json { render json: @blood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bloods/1
  # DELETE /bloods/1.json
  def destroy
    @blood.destroy
    respond_to do |format|
      format.html { redirect_to bloods_url, notice: 'Blood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blood
      @blood = Blood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blood_params
      params.require(:blood).permit(:group)
    end
end
