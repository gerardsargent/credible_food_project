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
#   @samples = @reading.samples

    @samples = Sample.where(sample_id: params[:id])

    # Report - Bacterial Micrograms (Samples 1-4) Cell Z13
    @bacterial_microgram_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:micrograms).last
    @bacterial_microgram_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:micrograms).last
    @bacterial_microgram_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:micrograms).last
    @bacterial_microgram_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:micrograms).last

    # Report - Actinobacteria Micrograms (Samples 1-4) Cell Z18
    @actinobacterial_microgram_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:actinobacteria_micrograms).last
    @actinobacterial_microgram_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:actinobacteria_micrograms).last
    @actinobacterial_microgram_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:actinobacteria_micrograms).last
    @actinobacterial_microgram_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:actinobacteria_micrograms).last

    # Report - Fungi Micrograms (Samples 1-4) Cell Z21
    @fungi_microgram_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:fungi_micrograms).last
    @fungi_microgram_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:fungi_micrograms).last
    @fungi_microgram_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:fungi_micrograms).last
    @fungi_microgram_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:fungi_micrograms).last

    # Report - Oomycetes Micrograms (Samples 1-4) Cell Z28
    @oomycetes_microgram_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:oomycetes_micrograms).last
    @oomycetes_microgram_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:oomycetes_micrograms).last
    @oomycetes_microgram_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:oomycetes_micrograms).last
    @oomycetes_microgram_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:oomycetes_micrograms).last

    # Report - Flagellate (Protozoa) (Samples 1-4) Cell Y35
    @flagellate_protozoa_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:flagellate_protozoa).last
    @flagellate_protozoa_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:flagellate_protozoa).last
    @flagellate_protozoa_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:flagellate_protozoa).last
    @flagellate_protozoa_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:flagellate_protozoa).last

    # Report - Amoebae (Protozoa) (Samples 1-4) Cell Y36
    @amoebae_protozoa_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:amoebae_protozoa).last
    @amoebae_protozoa_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:amoebae_protozoa).last
    @amoebae_protozoa_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:amoebae_protozoa).last
    @amoebae_protozoa_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:amoebae_protozoa).last 

    # Report - Ciliates (Protozoa) (Samples 1-4) Cell Y37
    @ciliates_protozoa_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:ciliates_protozoa).last
    @ciliates_protozoa_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:ciliates_protozoa).last
    @ciliates_protozoa_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:ciliates_protozoa).last
    @ciliates_protozoa_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:ciliates_protozoa).last 

    # Report - Nematodes (Bacteria) (Samples 1-4) Cell B41
    @nematodes_bacteria_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_bacteria).last
    @nematodes_bacteria_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_bacteria).last
    @nematodes_bacteria_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_bacteria).last
    @nematodes_bacteria_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_bacteria).last 

    # Report - Nematodes (Fungal) (Samples 1-4) Cell C41
    @nematodes_fungi_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_fungi).last
    @nematodes_fungi_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_fungi).last
    @nematodes_fungi_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_fungi).last
    @nematodes_fungi_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_fungi).last

    # Report - Nematodes (Root) (Samples 1-4) Cell E41
    @nematodes_root_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_root).last
    @nematodes_root_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_root).last
    @nematodes_root_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_root).last
    @nematodes_root_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_root).last

    # Report - Nematodes (Predator) (Samples 1-4) Cell D41
    @nematodes_predator_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_predator).last
    @nematodes_predator_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_predator).last
    @nematodes_predator_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_predator).last
    @nematodes_predator_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_predator).last

    # Report - Nematodes (Total) (Samples 1-4) Cell V41
    @nematodes_total_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_mean).last
    @nematodes_total_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_mean).last
    @nematodes_total_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_mean).last
    @nematodes_total_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_mean).last

    # Report - FB Biomass (Samples 1-4) Cell Z36
    @fb_biomass_ratio_report_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:fb_biomass_ratio).last
    @fb_biomass_ratio_report_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:fb_biomass_ratio).last
    @fb_biomass_ratio_report_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:fb_biomass_ratio).last
    @fb_biomass_ratio_report_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:fb_biomass_ratio).last
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
      @sample = Sample.where(sample_id: params[:id])
    end

    def set_user
      @user_id = current_user.id
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:client, :organisation, :date_collected, :date_observed, :location, :plants_present, :plants_desired, :other_notes, :observed_by, :lt_id, :cust_id, :user_id)
    end
end
