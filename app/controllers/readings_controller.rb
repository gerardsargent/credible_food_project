class ReadingsController < ApplicationController

  def readings_page
    @readings = Reading.all
  end

  def show
    @readings = Reading.find(params[:id])
    @cheese = "CHEESE" # Testing Purposes.
  end

  def new
  end

  def create
    # render plain: params[:readings].inspect
    @readings = Reading.new(params[reading_params])
    @readings.save
    redirect_to @readings
  end

  private def reading_params
    params.require(:readings).permit(:land_name, :crop_growing, :gps)
  end

end
