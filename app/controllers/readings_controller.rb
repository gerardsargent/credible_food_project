class ReadingsController < ApplicationController

  def readings_page
  end

  def new
  end

  def create
    render plain: params[:readings].inspect
  end

end
