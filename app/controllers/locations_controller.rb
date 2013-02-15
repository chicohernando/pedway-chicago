class LocationsController < ApplicationController
  def index
    @locations = Location.all.group_by{|l| l.name[0]}
  end

  def show
    @location = Location.find(params[:id])
  end
end
