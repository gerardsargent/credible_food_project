class ReadingsController < ApplicationController

  def readings_page
    @readingsVar = Reading.all
  end

  def show
    @readingsVar = Reading.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:readings].inspect <--- Testing Purposes
    readings_params = params.require(:readingsVar).permit(:land_name, :crop_growing, :gps)
    @readingsVar = Reading.new(readings_params)

    if (@readingsVar.save)
      redirect_to @readings
    else
      render 'new'
    end
  end

  def destroy
    @page = Reading.find(params[:id])
    @page.destroy
    redirect_to reading_path(reading)
  end

end
