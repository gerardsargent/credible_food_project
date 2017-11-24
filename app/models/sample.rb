class Sample < ApplicationRecord

    belongs_to :reading
    before_save :do_calc
    # validates_presence_of :reading_number, 
    #     :coverslip, 
    #     :bacterial_number, 
    #     :bacterial_size_shape, 
    #     :bacterial_dilution, 
    #     :actinobacteria, 
    #     :actinobacteria_dilution, 
    #     :fungi, 
    #     :fungi_diameter, 
    #     :fungi_colour, 
    #     :fungi_dilution, 
    #     :oomycetes, 
    #     :oomycetes_diameter, 
    #     :oomycetes_colour, 
    #     :oomycetes_dilution, 
    #     :flagellate, 
    #     :flagellate_dilution, 
    #     :amoebae, 
    #     :amoebae_dilution, 
    #     :ciliates, 
    #     :ciliates_dilution, 
    #     :nematodes_bacteria, 
    #     :nematodes_fungi, 
    #     :nematodes_predator, 
    #     :nematodes_root, 
    #     :nematodes_dilution, 
    #     :notes

    def do_calc
        bacterial_mean_calc
        bacteria_per_gm_calc
        bacterial_micrograms_calc
        actinobacteria_mean_calc
        actinobacteria_cm_length_calc
        actinobacteria_micrograms_calc
        fungi_mean_calc
        fungi_do_not_use_this_row_calc
        fungi_cm_for_calculation_calc
        fungal_strands_cm_calc
        fungi_average_diameter_in_um_calc
        fungi_average_diameter_cm_calc
        fungi_micrograms_calc
        oomycetes_mean_calc
        oomycetes_do_not_use_this_row_calc
        oomycetes_cm_for_calculation_calc
        oomycetes_strands_cm_calc
        oomycetes_average_diameter_in_um_calc
        oomycetes_average_diameter_cm_calc
        oomycetes_micrograms_calc
        flagellate_mean_calc
        flagellate_protozoa_calc
        amoebae_mean_calc
        amoebae_protozoa_calc
        ciliates_mean_calc
        ciliates_protozoa_calc
        nematodes_sum_calc
        nematodes_protozoa_calc
        biomass_ratio_calc
        entry_label_calc
    end

    def to_s
        id
    end
 
    private

    def bacterial_mean_calc
        # Cell V13
        # Take all of the readings for sample x and put them into an array
        @bacterial_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:bacterial_number)
        @bacterial_array.push(self.bacterial_number)
        
        # If this is the first reading of the associated sample, then default mean value to the value input by user
        if @bacterial_array.length == 1
            self.bacterial_mean = @bacterial_array[0]
            @bacterial_mean = self.bacterial_mean
        else
            #Use Descriptive Statistics gem to calculate values
            bacterial_mean = @bacterial_array.extend(DescriptiveStatistics)
            @bacterial_mean = bacterial_mean.mean
            self.bacterial_mean = @bacterial_mean.round(2)
        end

        bacterial_st_dev_calc

    end

    def bacterial_st_dev_calc
        # Cell W13
        # If this is the first reading of the sample, then standard deviation must be set to 0
        if @bacterial_array.length == 1
            @bacterial_st_dev = 0
        else
            stats = @bacterial_array.extend(DescriptiveStatistics)
            @bacterial_st_dev = stats.standard_deviation()
        end
        self.bacterial_standard_deviation = @bacterial_st_dev.round(2)
    end

    def bacteria_per_gm_calc
        # Cell Y13 
        @bacteria_per_gm = (((@bacterial_mean*self.bacterial_dilution)*self.coverslip)*22)
        self.no_bacteria_per_gram = @bacteria_per_gm
    end

    def bacterial_micrograms_calc
        # Cell Z13
        @bacterial_micrograms = ((@bacteria_per_gm * 0.000002))
        self.micrograms = @bacterial_micrograms
    end

    def actinobacteria_mean_calc
        # Cell V18
        # Take all of the readings for sample x and put them into an array
        actinobacteria_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:actinobacteria)
        actinobacteria_array.push(self.actinobacteria)
        @actinobacteria_array_compact = actinobacteria_array.compact

        # @actinobacteria_array.map!(&:to_f)
        
        if @actinobacteria_array_compact.length == 1
            self.actinobacteria_mean = @actinobacteria_array_compact[0]
            # This instance variable is set so that actinobacteria_cm_length_calc can execute later even when no other records exist
            @actinobacteria_mean = self.actinobacteria_mean
        else
            #Use Descriptive Statistics gem to calculate values
            actinobacteria_mean = @actinobacteria_array_compact.extend(DescriptiveStatistics)

            @actinobacteria_mean = actinobacteria_mean.mean
            # @actinobacteria_mean = @actinobacteria_sum / @actinobacteria_length
            self.actinobacteria_mean = @actinobacteria_mean.round(2)
        end

        actinobacteria_st_dev_calc
    end

    def actinobacteria_st_dev_calc
        # Cell W18
        if @actinobacteria_array_compact.length == 1
            @actinobacteria_st_dev = 0
        else
            stats = @actinobacteria_array_compact.extend(DescriptiveStatistics)
            @actinobacteria_st_dev = stats.standard_deviation()
        end
        self.actinobacterial_standard_deviation = @actinobacteria_st_dev.round(2)
    end

    def actinobacteria_cm_length_calc
        # Cell Y18
        @actino_cm_length = (((@actinobacteria_mean * self.actinobacteria_dilution) * self.coverslip)*22)
        self.actinobacteria_length_cm = @actino_cm_length
    end

    def actinobacteria_micrograms_calc
        # Cell Z18
        @actinobacteria_micrograms = (@actino_cm_length*(3.14*((0.00005*0.00005)*230000)))
        self.actinobacteria_micrograms = @actinobacteria_micrograms
    end

    def fungi_mean_calc
        # Cell V21
        # Take all of the readings for sample x and put them into an array
        fungi_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:fungi)
        fungi_array.push(self.fungi)
        @fungi_array_compact = fungi_array.compact
        
        if @fungi_array_compact.length == 1
            self.fungi_mean = @fungi_array_compact[0]
            # This instance variable is set so that fungi_cm_length_calc can execute later even when no other records exist
            @fungi_mean = self.fungi_mean
        else
            #Use Descriptive Statistics gem to calculate values
            fungi_mean = @fungi_array_compact.extend(DescriptiveStatistics)

            @fungi_mean = fungi_mean.mean
            # @fungi_mean = @fungi_sum / @fungi_length
            self.fungi_mean = @fungi_mean.round(2)
        end

        fungi_st_dev_calc
    end

    def fungi_st_dev_calc
        # Cell W21
        if @fungi_array_compact.length == 1
            @fungi_st_dev = 0
        else
            stats = @fungi_array_compact.extend(DescriptiveStatistics)
            @fungi_st_dev = stats.standard_deviation()
        end
        self.fungi_standard_deviation = @fungi_st_dev.round(2)
    end

    def fungi_do_not_use_this_row_calc
        # Refers row 26 
        @fungi_do_not_use_this_row_calc = self.fungi * self.fungi_diameter

        self.fungi_calculation = @fungi_do_not_use_this_row_calc

    end

    def fungi_cm_for_calculation_calc
        # Cell V22
        fungi_cm_for_calculation_calc = (self.fungi_mean * 0.045)
        @fungi_cm_for_calculation_calc_round = fungi_cm_for_calculation_calc.round(3)

        self.fungal_cm_length_for_calc = @fungi_cm_for_calculation_calc_round
    end

    def fungal_strands_cm_calc
        # Cell Y21
        @fungal_strands_cm = (((@fungi_cm_for_calculation_calc_round*self.fungi_dilution)*self.coverslip)*22)


        # puts '@fungi_cm_for_calculation_calc_round:'
        # puts @fungi_cm_for_calculation_calc_round
        # puts 'self.fungi_dilution:'
        # puts self.fungi_dilution
        # puts 'self.coverslip:'
        # puts self.coverslip
        # puts '@fungal_strands_cm:'
        # puts @fungal_strands_cm

        self.fungal_strands_cm = @fungal_strands_cm

        # NOTE - Incorrect value produced. Appears to be a discrepancy between how Rails and Excel calculate nested sums

        puts 'self.fungal_strands_cm:'
        puts self.fungal_strands_cm
    end

    def fungi_average_diameter_in_um_calc
        # Cell V26
        # Take all of the readings for sample x and put them into an array. This is a reproduction of the formula in fungi_mean_calc above to enable the @fungi_av_di_final calculation at the end of this method
        fungi_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:fungi)

        fungi_array.push(self.fungi)

        fungi_sum = fungi_array.sum.round(1)

        # Take all the values from the fungi 'do not use this row' calculations
        fungi_do_not_use_this_row_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:fungi_calculation)

        fungi_do_not_use_this_row_array.push(@fungi_do_not_use_this_row_calc)

        # Remove any nil values so the array can be calculated
        fungi_do_not_use_this_row_array_compact = fungi_do_not_use_this_row_array.compact

        # Add together all the values in the compacted array
        fungi_do_not_use_this_row_array_calc_sum = fungi_do_not_use_this_row_array_compact.sum   

        fungi_av_diameter_final = fungi_do_not_use_this_row_array_calc_sum / fungi_sum
        @fungi_av_di_final = fungi_av_diameter_final.round(1)
        self.fungi_average_diameter_in_um = @fungi_av_di_final
    end

    def fungi_average_diameter_cm_calc
        # Cell W26
        @fungi_av_di_cm = @fungi_av_di_final * 0.0001
        self.fungi_average_diameter_in_cm = @fungi_av_di_cm 
    end

    def fungi_micrograms_calc
        # Cell Z21

        @fungi_micrograms = (@fungal_strands_cm*((3.14*((0.5*@fungi_av_di_cm)*(0.5*@fungi_av_di_cm)))*3300000))

        # NOTE - incorrect value at present due to discrepancy in fungal_strands_cm_calc above

        self.fungi_micrograms = @fungi_micrograms
    end

    def oomycetes_mean_calc
        # Cell V28
        # Take all of the readings for sample x and put them into an array
        oomycetes_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:oomycetes)
        oomycetes_array.push(self.oomycetes)
        @oomycetes_array_compact = oomycetes_array.compact
        #Calculate sum of array for use in oomycetes_average_diameter_in_um_calc below
        @oomycetes_sum = @oomycetes_array_compact.sum

        if @oomycetes_array_compact.length == 1
            self.oomycetes_mean = @oomycetes_array_compact[0]
            # This instance variable is set so that oomycetes_cm_length_calc can execute later even when no other records exist
            @oomycetes_mean = self.oomycetes_mean
        else
            #Use Descriptive Statistics gem to calculate values
            oomycetes_mean = @oomycetes_array_compact.extend(DescriptiveStatistics)


            @oomycetes_mean = oomycetes_mean.mean
            # @oomycetes_mean = @oomycetes_sum / @oomycetes_length
            self.oomycetes_mean = @oomycetes_mean.round(2)
        end

        oomycetes_st_dev_calc
        
    end

    def oomycetes_st_dev_calc
        # Cell W28
        if @oomycetes_array_compact.length == 1
            @oomycetes_st_dev = 0
        else
            stats = @oomycetes_array_compact.extend(DescriptiveStatistics)
            @oomycetes_st_dev = stats.standard_deviation()
        end
        self.oomycetes_standard_deviation = @oomycetes_st_dev.round(2)
    end

    def oomycetes_do_not_use_this_row_calc
        # Refers to row 33 
        @oomycetes_do_not_use_this_row_calc = self.oomycetes * self.oomycetes_diameter

        puts "@oomycetes_do_not_use_this_row_calc:"
        puts @oomycetes_do_not_use_this_row_calc

        self.oomycetes_calculation = @oomycetes_do_not_use_this_row_calc

        puts "self.oomycetes_calculation:"
        puts self.oomycetes_calculation
    end

    def oomycetes_cm_for_calculation_calc
        # Cell V29
        @oomycetes_cm_for_calculation_calc = (self.oomycetes_mean * 0.045)
        self.oomycetes_cm_length_for_calc = @oomycetes_cm_for_calculation_calc.round(3)
    end

    def oomycetes_strands_cm_calc
        # Cell Y28

        # NOTE - Incorrect value produced. Appears to be a discrepancy between how Rails and Excel calculate nested sums

        @oomycetes_strands_cm = (((@oomycetes_cm_for_calculation_calc.round(3) * self.oomycetes_dilution) * self.coverslip) * 22)
        self.oomycetes_strands_cm = @oomycetes_strands_cm
 
    end

    def oomycetes_average_diameter_in_um_calc
        # Cell V33

        # Take all of the readings for sample x and put them into an array. This is a reproduction of the formula in fungi_mean_calc above to enable the @fungi_av_di_final calculation at the end of this method
        oomycetes_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:oomycetes)

        oomycetes_array.push(self.oomycetes)

        # puts 'oomycetes_array:'
        # puts oomycetes_array.inspect

        oomycetes_sum = oomycetes_array.sum.round(1)

        # puts 'oomycetes_sum:'
        # puts oomycetes_sum

        # Take all the values from the oomycetes 'do not use this row' calculations
        oomycetes_do_not_use_this_row_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:oomycetes_calculation)

        oomycetes_do_not_use_this_row_array.push(@oomycetes_do_not_use_this_row_calc)

        # Remove any nil values so the array can be calculated
        oomycetes_do_not_use_this_row_array_compact = oomycetes_do_not_use_this_row_array.compact

        # puts 'oomycetes_do_not_use_this_row_array:'
        # puts oomycetes_do_not_use_this_row_array.inspect

        # Add together all the values in the compacted array
        oomycetes_do_not_use_this_row_array_calc_sum = oomycetes_do_not_use_this_row_array_compact.sum

        # puts 'oomycetes_do_not_use_this_row_array_calc_sum:'
        # puts oomycetes_do_not_use_this_row_array_calc_sum

        oomycetes_av_diameter_final = oomycetes_do_not_use_this_row_array_calc_sum / oomycetes_sum
        @oomycetes_av_di_final = oomycetes_av_diameter_final.round(1)
        self.oomycetes_average_diameter_in_um = @oomycetes_av_di_final

        # puts 'oomycetes_av_diameter_final:'
        # puts oomycetes_av_diameter_final
        # puts '@oomycetes_av_di_final (pre-round):'
        # puts @oomycetes_av_di_final
        # puts 'self.oomycetes_average_diameter_in_um:'
        # puts self.oomycetes_average_diameter_in_um        

    end

    def oomycetes_average_diameter_cm_calc
        # Cell W33
        @oomycetes_av_di_cm = @oomycetes_av_di_final * 0.0001

        self.oomycetes_average_diameter_in_cm = @oomycetes_av_di_cm 
    end

    def oomycetes_micrograms_calc
        # Cell Z28
        @oomycetes_mg = (@oomycetes_strands_cm*((3.14 * ((0.5 * @oomycetes_av_di_cm) * (0.5 * @oomycetes_av_di_cm))) * 3300000))

        puts '@oomycetes_strands_cm = '
        puts @oomycetes_strands_cm
        puts '@oomycetes_av_di_cm = '
        puts @oomycetes_av_di_cm
        puts '@oomycetes_mg = '        
        puts @oomycetes_mg
        puts 'self.oomycetes_micrograms = '
        puts self.oomycetes_micrograms

        self.oomycetes_micrograms = @oomycetes_mg
    end

    def flagellate_mean_calc
        # Take all of the readings for sample x and put them into an array
        flagellate_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:flagellate)
        flagellate_array.push(self.flagellate)
        @flagellate_array_compact = flagellate_array.compact
        #Calculate sum of array for use in flagellate_average_diameter_in_um_calc below
        @flagellate_sum = @flagellate_array_compact.sum

        if @flagellate_array_compact.length == 1
            self.flagellate_mean = @flagellate_array_compact[0]
            # This instance variable is set so that flagellate_cm_length_calc can execute later even when no other records exist
            @flagellate_mean = self.flagellate_mean
        else
            #Use Descriptive Statistics gem to calculate values
            flagellate_mean = @flagellate_array_compact.extend(DescriptiveStatistics)


            @flagellate_mean = flagellate_mean.mean
            # @flagellate_mean = @flagellate_sum / @flagellate_length
            self.flagellate_mean = @flagellate_mean.round(2)
        end

        flagellate_st_dev_calc

    end

    def flagellate_st_dev_calc
        # Cell W28
        if @flagellate_array_compact.length == 1
            @flagellate_st_dev = 0
        else
            stats = @flagellate_array_compact.extend(DescriptiveStatistics)
            @flagellate_st_dev = stats.standard_deviation()
        end
        self.flagellate_standard_deviation = @flagellate_st_dev.round(2)
    end

    def flagellate_protozoa_calc
        # Cell Y35
        self.flagellate_protozoa = (((@flagellate_mean*self.flagellate_dilution)*self.coverslip)*22)
    end

    def amoebae_mean_calc
        # Take all of the readings for sample x and put them into an array
        amoebae_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:amoebae)
        amoebae_array.push(self.amoebae)
        @amoebae_array_compact = amoebae_array.compact
        #Calculate sum of array for use in amoebae_average_diameter_in_um_calc below
        @amoebae_sum = @amoebae_array_compact.sum

        if @amoebae_array_compact.length == 1
            self.amoebae_mean = @amoebae_array_compact[0]
            # This instance variable is set so that amoebae_cm_length_calc can execute later even when no other records exist
            @amoebae_mean = self.amoebae_mean
        else
            #Use Descriptive Statistics gem to calculate values
            amoebae_mean = @amoebae_array_compact.extend(DescriptiveStatistics)


            @amoebae_mean = amoebae_mean.mean
            # @amoebae_mean = @amoebae_sum / @amoebae_length
            self.amoebae_mean = @amoebae_mean.round(2)
        end

        amoebae_st_dev_calc

    end

    def amoebae_st_dev_calc
        # Cell W28
        if @amoebae_array_compact.length == 1
            @amoebae_st_dev = 0
        else
            stats = @amoebae_array_compact.extend(DescriptiveStatistics)
            @amoebae_st_dev = stats.standard_deviation()
        end
        self.amoebae_standard_deviation = @amoebae_st_dev.round(2)
    end

    def amoebae_protozoa_calc
        # Cell Y36
        self.amoebae_protozoa = (((@amoebae_mean*self.amoebae_dilution)*self.coverslip)*22)
    end

    def ciliates_mean_calc
        # Take all of the readings for sample x and put them into an array
        ciliates_array = Sample.where(sample_id: sample_id).where.not(id: self.id).pluck(:ciliates)
        ciliates_array.push(self.ciliates)
        @ciliates_array_compact = ciliates_array.compact
        #Calculate sum of array for use in ciliates_average_diameter_in_um_calc below
        @ciliates_sum = @ciliates_array_compact.sum

        if @ciliates_array_compact.length == 1
            self.ciliates_mean = @ciliates_array_compact[0]
            # This instance variable is set so that ciliates_cm_length_calc can execute later even when no other records exist
            @ciliates_mean = self.ciliates_mean
        else
            #Use Descriptive Statistics gem to calculate values
            ciliates_mean = @ciliates_array_compact.extend(DescriptiveStatistics)


            @ciliates_mean = ciliates_mean.mean
            # @ciliates_mean = @ciliates_sum / @ciliates_length
            self.ciliates_mean = @ciliates_mean.round(2)
        end

        ciliates_st_dev_calc

    end

    def ciliates_st_dev_calc
        # Cell W28
        if @ciliates_array_compact.length == 1
            @ciliates_st_dev = 0
        else
            stats = @ciliates_array_compact.extend(DescriptiveStatistics)
            @ciliates_st_dev = stats.standard_deviation()
        end
        self.ciliates_standard_deviation = @ciliates_st_dev.round(2)
    end

    def ciliates_protozoa_calc
        # Cell Y37
        self.ciliates_protozoa = (((@ciliates_mean*self.ciliates_dilution)*self.coverslip)*22)
    end

    def nematodes_sum_calc
        # Cell V41 - this is actually a SUM in the original spreadsheet. I have kept the name 'mean' as it was already written in the spreadsheet but this will need changing later

        nematodes_array = [self.nematodes_bacteria, self.nematodes_fungi, self.nematodes_predator, self.nematodes_root]

        puts '*****************'
        puts 'nematodes_array = '
        puts nematodes_array.inspect
        puts '*****************'

        @nematodes_sum = nematodes_array.inject(0){|sum,x| sum + x }

        puts '*****************'
        puts '@nematodes_sum = '
        puts @nematodes_sum
        puts '*****************'

        self.nematodes_mean = @nematodes_sum
    end

    def nematodes_protozoa_calc
        # Cell Y41
        self.nematodes_protozoa = (@nematodes_sum * self.nematodes_dilution) * 20
    end

    def biomass_ratio_calc
        self.fb_biomass_ratio = (@fungi_micrograms / (@bacterial_micrograms + @actinobacteria_micrograms))
    end

    def entry_label_calc
        # Take all of the readings for sample x and put them into an array
        #entry_1_label_array
        # entry_1_label_array = Sample.where(sample_gp: 1).pluck(:sample_gp)
        entry_1_label_array = Sample.where(sample_gp: 1).where(sample_id: sample_id).pluck(:sample_gp)
        entry_1_label_array_new = entry_1_label_array.push(self.sample_gp)
        entry_1_label_array_compact = entry_1_label_array_new.compact
        entry_1_label_array_extract = entry_1_label_array_compact.select { |e| e == 1 }
        @entry_1_label = entry_1_label_array_extract.length
        self.entry_1_label = @entry_1_label
        
        # entry_2_label_array
        entry_2_label_array = Sample.where(sample_gp: 2).where(sample_id: sample_id).pluck(:sample_gp)
        entry_2_label_array_new = entry_2_label_array.push(self.sample_gp)
        entry_2_label_array_compact = entry_2_label_array_new.compact
        entry_2_label_array_extract = entry_2_label_array_compact.select { |e| e == 2 }
        @entry_2_label = entry_2_label_array_extract.length
        self.entry_2_label = @entry_2_label

        # entry_3_label_array
        entry_3_label_array = Sample.where(sample_gp: 3).where(sample_id: sample_id).pluck(:sample_gp)
        entry_3_label_array_new = entry_3_label_array.push(self.sample_gp)
        entry_3_label_array_compact = entry_3_label_array_new.compact
        entry_3_label_array_extract = entry_3_label_array_compact.select { |e| e == 3 }
        @entry_3_label = entry_3_label_array_extract.length
        self.entry_3_label = @entry_3_label

        # entry_4_label_array
        entry_4_label_array = Sample.where(sample_gp: 4).where(sample_id: sample_id).pluck(:sample_gp)
        entry_4_label_array_new = entry_4_label_array.push(self.sample_gp)
        entry_4_label_array_compact = entry_4_label_array_new.compact
        entry_4_label_array_extract = entry_4_label_array_compact.select { |e| e == 4 }
        @entry_4_label = entry_4_label_array_extract.length
        self.entry_4_label = @entry_4_label
    end
        
end