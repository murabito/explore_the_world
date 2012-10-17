class PlacesController < ApplicationController

	def new
		@guide = Guide.find(params[:guide_id])
		@place = Place.new
	end

	def create
		@guide = Guide.find(params[:guide_id])
		@place = @guide.places.build(params[:place])
    if @place.save
      flash[:notice] = "Place was successfully created."
      redirect_to [@guide, @place]
    else
      flash[:alert] = "Place has not been created."
      render :new
    end
	end
end
