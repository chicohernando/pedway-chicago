class LocationsController < ApplicationController
  def index
    @locations = Location.order_by_name
  end

  def show
    @location = Location.find(params[:id])
  end
end
