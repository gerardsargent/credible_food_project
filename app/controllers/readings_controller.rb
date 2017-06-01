class ReadingsController < ApplicationController

  def readings_page
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

  def destroy
    @page = Reading.find(params[:id])
    @page.destroy
    redirect_to readings_path(reading)
  end

end
