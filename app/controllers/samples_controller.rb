class SamplesController < ApplicationController
  before_action :set_sample, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
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
    @page_title = @sample.sample_id
  end

  # GET /samples/new
  def new
    # this is temporary until it works then we can put it in the route - this is probably the edit view
    @sample_id = 42

   # get existing readings from database   
    @samples = Sample.where(sample_id: @sample_id).to_a

    # add new item to array for next reading number if < 20
    @sample = Sample.new
    @sample.reading_number = @samples.length + 1

    @page_title = "Input Sample Data"
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples
  # POST /samples.json
  def create
    # @sample = Sample.new(sample_params)
    # @sample.save

       sample_params.each do |reading_number,sample|
      @sample = Sample.new(sample)
      @sample.reading_number = reading_number
      @sample.save
    end


 #   respond_to do |format|
  #    puts "-----------------------"
   #   puts "sample_params = "
    #  sample_params.each do |k, v|
     #   puts(k)
     #   puts(v)
     # end
     # puts "-----------------------"

#      if @sample.save
      #  format.html { redirect_to @sample, notice: 'Sample was successfully created.' }
      #  format.json { render :show, status: :created, location: @sample }
 #     else
  #      format.html { render :new }
   #     format.json { render json: @sample.errors, status: :unprocessable_entity }
    #  end
   # end
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
      @sample = Sample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_params
      params.permit(:user_id, :sample_id, :bacterial_number, :bacterial_size_shape, :bacterial_mean, :bacterial_standard_deviation, :bacterial_dilution, :no_bacteria_per_gram, :micrograms, :actinobacteria, :actinobacteria_mean, :actinobacterial_standard_deviation, :actinobacteria_dilution, :actinobacteria_dilution, :actinobacteria_length_cm, :actinobacteria_micrograms, :fungi, :fungi_diameter, :fungi_colour, :fungi_calculation, :fungi_mean, :fungi_standard_deviation, :fungi_dilution, :fungal_strands_cm, :fungi_micrograms, :oomycetes, :oomycetes_diameter, :oomycetes_colour, :oomycetes_calculation, :oomycetes_mean, :oomycetes_standard_deviation, :oomycetes_dilution, :oomycetes_number_per_gram, :oomycetes_micrograms, :flagellate, :flagellate_mean, :flagellate_standard_deviation, :flagellate_dilution, :flagellate_protozoa, :amoebae, :amoebae_mean, :amoebae_standard_deviation, :amoebae_dilution, :amoebae_protozoa, :ciliates, :ciliates_mean, :ciliates_standard_deviation, :ciliates_dilution, :ciliates_protozoa, :nematodes, :nematodes_mean, :nematodes_dilution, :nematodes_protozoa, :fb_biomass_ratio, :gps, :sample_date, :coverslip)
      #(:bacterial_number, :bacterial_size_shape, :actinobacteria, :fungi, :fungi_diameter, :fungi_colour, :oomycetes, :oomycetes_diameter, :oomycetes_colour, :flagellate, :amoebae, :ciliates)
    end
end
