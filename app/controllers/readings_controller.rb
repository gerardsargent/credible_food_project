class ReadingsController < ApplicationController
  before_action :set_reading, :set_user, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /readings
  def index
    @readings = Reading.all
    @user_readings = current_user.readings
  end

  # GET /readings/1
  def show
#    @samples = @reading.samples
    @samples = Sample.where(sample_id: params[:id])
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
    @reading.user = current_user

    if @reading.save
      redirect_to @reading, notice: 'Reading was successfully created.'
    else
      render :new, notice: 'An error occured. Try submitting your record again.'
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

    def set_user
      @user_id = current_user.id
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:client, :organisation, :date_collected, :date_observed, :location, :plants_present, :plants_desired, :other_notes, :observed_by, :lt_id, :cust_id, :user_id)
    end
end
