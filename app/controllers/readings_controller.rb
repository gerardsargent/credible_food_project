class ReadingsController < ApplicationController

  def index
    @readings = Reading.all
  end

  def show
    @readings = Reading.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:readings].inspect <--- Testing Purposes
    readings_params = params.require(:readings).permit(:land_name, :crop_growing, :gps)
    @readings = Reading.new(readings_params)
    @readings.save
    redirect_to readings_url
  end

  def edit
    @readings = Reading.find(params[:id])
  end

  def update
    @readings = Reading.find(params[:id])
    readings_params = params.require(:readings).permit(:land_name, :crop_growing, :gps)
    @readings.update(reading_params)
    redirect_to @readings
  end

  def destroy
    @readings = Reading.find(params[:id])
    @readings.destroy
    redirect_to readings_path
  end

end
