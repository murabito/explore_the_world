class PlacesController < ApplicationController
  helper_method :place

  def show
  end
	
	def new
		@guide = Guide.find(params[:guide_id])
		@place = Place.new
	end

	def create
		@guide = Guide.find(params[:guide_id])
		if @guide.nil?
			flash[:alert] = "This guide does not exist."
			render :new
	  else
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

private
  def place
    @place ||= Guide.find(params[:guide_id]).places.find_by_id(params[:id])
  end  
end
