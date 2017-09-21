class SamplesController < ApplicationController
  before_action :set_sample, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], user: {except: [:destroy]}, site_admin: :all
  layout "sample"

  # GET /samples
  # GET /samples.json
  def index
    @samples = Sample.all
    @page_title = "Sample History Overview"
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
    @reading = Reading.find(params[:reading_id])
    @sample_gp_1 = Sample.where(sample_id: params[:reading_id], :sample_gp => 1 )
    @sample_gp_2 = Sample.where(sample_id: params[:reading_id], :sample_gp => 2 )
    @sample_gp_3 = Sample.where(sample_id: params[:reading_id], :sample_gp => 3 )
    @sample_gp_4 = Sample.where(sample_id: params[:reading_id], :sample_gp => 4 )
    @page_title = "Input sample data"

    @sample = @reading.samples.build
  end

  # GET /samples/new
  def new
    # this is temporary until it works then we can put it in the route - this is probably the edit view
    @reading = Reading.find(params[:reading_id])

    @sample_gp_1 = Sample.where(sample_id: params[:reading_id], :sample_gp => 1 )
    @sample_gp_2 = Sample.where(sample_id: params[:reading_id], :sample_gp => 2 )
    @sample_gp_3 = Sample.where(sample_id: params[:reading_id], :sample_gp => 3 )
    @sample_gp_4 = Sample.where(sample_id: params[:reading_id], :sample_gp => 4 )

    # Nematodes (Bacteria) (Samples 1-4) Cell B41
    @nematodes_bacteria_last_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_bacteria).last
    @nematodes_bacteria_last_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_bacteria).last
    @nematodes_bacteria_last_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_bacteria).last
    @nematodes_bacteria_last_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_bacteria).last 

    # Nematodes (Fungal) (Samples 1-4) Cell C41
    @nematodes_fungi_last_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_fungi).last
    @nematodes_fungi_last_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_fungi).last
    @nematodes_fungi_last_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_fungi).last
    @nematodes_fungi_last_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_fungi).last

    # Nematodes (Root) (Samples 1-4) Cell E41
    @nematodes_root_last_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_root).last
    @nematodes_root_last_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_root).last
    @nematodes_root_last_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_root).last
    @nematodes_root_last_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_root).last

    # Nematodes (Predator) (Samples 1-4) Cell D41
    @nematodes_predator_last_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_predator).last
    @nematodes_predator_last_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_predator).last
    @nematodes_predator_last_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_predator).last
    @nematodes_predator_last_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_predator).last

    # Nematodes (Dilution) (Samples 1-4) Cell D41
    @nematodes_dilution_last_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:nematodes_dilution).last
    @nematodes_dilution_last_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:nematodes_dilution).last
    @nematodes_dilution_last_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:nematodes_dilution).last
    @nematodes_dilution_last_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:nematodes_dilution).last

    # Notes (Samples 1-4)
    @notes_last_1 = Sample.where(id: @reading.samples, sample_gp: 1).pluck(:notes).last
    @notes_last_2 = Sample.where(id: @reading.samples, sample_gp: 2).pluck(:notes).last
    @notes_last_3 = Sample.where(id: @reading.samples, sample_gp: 3).pluck(:notes).last
    @notes_last_4 = Sample.where(id: @reading.samples, sample_gp: 4).pluck(:notes).last

    # get existing readings from database   
    @samples = Sample.where(sample_id: params[:reading_id]).to_a

    # add new item to array for next reading number if < 20
    @sample = @reading.samples.new
    @sample.reading_number = @samples.length + 1
    
    @page_title = "Input Sample Data"
  end

  # GET /samples/1/edit
  def edit

  end

  # POST /samples
  # POST /samples.json
  def create
    @reading = Reading.find(params[:reading_id])
    
    # @reading = Reading.samples.new(sample_params)
    @samples = Sample.where(sample_id: params[:reading_id]).to_a

    @sample = @reading.samples.new(sample_params)
    @sample.sample_id = params[:reading_id]
    @sample.reading_number = @samples.length + 1

    # respond_to do |format|
    #   puts "-----------------------"
    #   puts "sample_params = "
    #   sample_params.each do |k, v|
    #     puts(k)
    #     puts(v)
    #   end
    #   puts "-----------------------"

    respond_to do |format|
      if @sample.save
        format.html { redirect_to new_reading_sample_path, notice: 'Sample was successfully created.' }
      else
        redirect_to new_reading_sample_path, notice: 'An error occured. Try submitting your record again.'
      end
    end

    puts 'params = '
    puts params.inspect
  end

  # PATCH/PUT /samples/1
  # PATCH/PUT /samples/1.json
  def update
    respond_to do |format|
      if @sample.update(sample_params)
        format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @sample }
      else
        format.html { render :edit }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample.destroy
    respond_to do |format|
      format.html { redirect_to samples_url, notice: 'Sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      # @sample = Sample.find(params[:id])
      @sample = Sample.where(sample_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_params
      params.require(:sample).permit(
        :sample_id, 
        :sample_gp, 
        :bacterial_number, 
        :bacterial_size_shape, 
        :bacterial_mean, 
        :bacterial_standard_deviation, 
        :bacterial_dilution, 
        :no_bacteria_per_gram, 
        :micrograms, 
        :actinobacteria, 
        :actinobacteria_mean, 
        :actinobacterial_standard_deviation, 
        :actinobacteria_dilution, 
        :actinobacteria_dilution, 
        :actinobacteria_length_cm, 
        :actinobacteria_micrograms, 
        :fungi, 
        :fungi_diameter, 
        :fungi_colour, 
        :fungi_calculation, 
        :fungi_mean, 
        :fungi_standard_deviation, 
        :fungi_dilution, 
        :fungal_strands_cm, 
        :fungi_micrograms, 
        :oomycetes, 
        :oomycetes_diameter, 
        :oomycetes_colour, 
        :oomycetes_calculation, 
        :oomycetes_mean, 
        :oomycetes_standard_deviation, 
        :oomycetes_dilution, 
        :oomycetes_number_per_gram, 
        :oomycetes_micrograms, 
        :flagellate, 
        :flagellate_mean, 
        :flagellate_standard_deviation, 
        :flagellate_dilution, 
        :flagellate_protozoa, 
        :amoebae, 
        :amoebae_mean, 
        :amoebae_standard_deviation, 
        :amoebae_dilution, 
        :amoebae_protozoa, 
        :ciliates, 
        :ciliates_mean, 
        :ciliates_standard_deviation, 
        :ciliates_dilution, 
        :ciliates_protozoa, 
        :nematodes_bacteria, 
        :nematodes_fungi, 
        :nematodes_predator, 
        :nematodes_root, 
        :nematodes_mean, 
        :nematodes_dilution, 
        :nematodes_protozoa, 
        :fb_biomass_ratio, 
        :coverslip, 
        :notes, 
        :reading_number)
    end
end
