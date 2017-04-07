class PagesController < ApplicationController
  before_action :load_association
  before_action :authenticate_admin!, only: [:report]


  def index
  end

  def about
  end

  def contact
  end



  def search
    @search = Member.ransack(params[:q])
    @members = @search.result.includes(:blood, :house)
    # @search.build_condition
    # puts("Search Params #{params}")
    # name = params[:name]
    # association = params[:association]
    # blood_id = params[:blood_group][:blood_id]
    # lat = params[:lat]
    # lng = params[:lng]
    #
    # @members = Member.all
    #
    # if name!=""
    #   @members = Member.where(name: name)
    # end
    # if name==""
    #   @members = Member.all
    # else
    #   @members = Member.where("name LIKE ?", "%#{name}%")
    #   puts("Here are the members based on the name #{@members}")
    # end
    #
    # if association==""
    # else
    #   association_ids = ResidenceAssociation.where(name: association).pluck(:id)
    #   houses_ids = House.find_by(residence_association_id: association_ids)
    #   @members = @members.where(house_id: houses_ids)
    # end
    #
    # if blood_id==""
    # else
    #   # @members = @members.where(blood_id: blood_id)
    # end
    #
    # if lat==""
    # else
    #   lat = lat.to_f
    #   lng = lng.to_f
    #   houses_ids = House.where('lat BETWEEN ' + (lat-1).to_s + ' AND ' + (lat+1).to_s).pluck(:id)
    #   # houses_ids = associations.map(&:id)
    #   @members = @members.where(house_id: houses_ids)
    # end
  end
end
