class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /readings
  def index
    @readings = Reading.all
    @user_readings = current_user.readings
    @user_id = current_user.id
    puts "******************"
    puts "@user_id:"
    puts @user_id
    puts "******************"
  end

  # GET /readings/1
  def show
  end

  # GET /readings/new
  def new
    @reading = Reading.new
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  def create
    @reading = Reading.new(reading_params)

    if @reading.save
      redirect_to @reading, notice: 'Reading was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /readings/1
  def update
    if @reading.update(reading_params)
      redirect_to @reading, notice: 'Reading was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /readings/1
  def destroy
    @reading.destroy
    redirect_to readings_url, notice: 'Reading was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:client, :organisation, :date_collected, :date_observed, :location, :plants_present, :plants_desired, :other_notes, :observed_by, :lt_id, :cust_id, :user_id)
    end
end
