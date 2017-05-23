class ReadingsController < ApplicationController

  def readings_page
    @readings = Reading.all
  end

  def show
    @reading = Reading.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:readings].inspect
    @reading = Reading.new(params[reading_params])
    @reading.save
    redirect_to @reading
  end

  private def reading_params
    params.require(:readings).permit(:land_name, :crop_growing, :gps)
  end

end
