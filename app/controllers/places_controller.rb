class PlacesController < ApplicationController
before_filter :find_place, :only => [ :show,
                                      :edit,
                                      :update,
                                      :destroy ]

  before_filter :find_guide, :only => [ :show, :new ]

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
  def find_guide
    @guide = Guide.find(params[:guide_id])
  end

  def find_place
    @place ||= Guide.find(params[:guide_id]).places.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The place you were looking for could not be found."
    redirect_to guide_places_path  
  end  
end
