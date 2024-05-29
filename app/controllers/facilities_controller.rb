class FacilitiesController < ApplicationController
  def index
    facilities = Facility.all
    facilities = facilities.where("name LIKE ?", "%#{params[:sports]}%") if params[:sports].present?
    facilities = facilities.where("pincode LIKE ?", "%#{params[:pincode]}%") if params[:pincode].present?
    render json: facilities

  end

  def show
    facility = Facility.find(params[:id])
    render json: facility
  end
end
