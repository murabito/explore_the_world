class GuidesController < ApplicationController
  helper_method :guide

  def index
    @guides = Guide.all
  end

  def show
  end

  def new
  	@guide = Guide.new
  end

  def create
    @guide = Guide.new(params[:guide])
    if @guide.save
      flash[:notice] = "Guide was successfully created."
      redirect_to @guide
    else
      flash[:alert] = "Guide has not been created."
      render :new
    end
  end


private
  def guide
    @guide ||= Guide.find_by_id(params[:id])
  end  
end
