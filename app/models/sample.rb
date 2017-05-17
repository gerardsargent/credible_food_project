class Sample < ApplicationRecord
    before_save :do_calc

    def do_calc
        bacterial_mean_calc
        bacterial_st_dev_calc
        bacteria_per_gm_calc
        bacterial_micrograms_calc
        actino_mean_calc
        actino_st_dev_calc
        actino_cm_length_calc
        fungi_mean_calc
        fungi_st_dev_calc
        fungi_do_not_use_this_row_calc
        fungi_cm_for_calculation_calc
        fungal_strands_cm_calc
        fungi_average_diameter_in_um_calc
        fungi_average_diameter_cm_calc
        oomycetes_mean_calc
        oomycetes_st_dev_calc
        oomycetes_do_not_use_this_row_calc
    end
 
    private
    
    def bacterial_mean_calc
        # Take all of the readings for sample x and put them into an array
        @reading_array = Sample.where(sample_id: sample_id).pluck(:bacterial_number)
        # Turn all of the values inside array into floats
        @reading_array.map!(&:to_f)
        # Count the length of @readings_array
        @reading_length = @reading_array.length
        # Sum the total of all the values stored in the @readings array
        @bacterial_sum = @reading_array.sum
        
        @bacterial_mean = @bacterial_sum / @reading_length
        self.bacterial_mean = @bacterial_mean.round(2)
    end

    def actino_mean_calc
        @actino_array = Sample.where(sample_id: sample_id).pluck(:actinobacteria)
        @actino_array.map!(&:to_f)
        @actino_length = @actino_array.length
        @actino_sum = @actino_array.sum

        @actino_mean = @actino_sum / @actino_length
        self.actinobacteria_mean = @actino_mean.round(2)
    end

    def bacterial_st_dev_calc
        sum_sqr = @reading_array.map {|x| x * x}.reduce(&:+)
        
        self.bacterial_standard_deviation = Math.sqrt((sum_sqr - @reading_length * @bacterial_mean * @bacterial_mean)/(@reading_length-1)).round(2)
    end

    def bacteria_per_gm_calc
        @bacteria_per_gm = (((@bacterial_mean * self.bacterial_dilution) * self.coverslip)*22)
        self.no_bacteria_per_gram = @bacteria_per_gm
    end

    def bacterial_micrograms_calc
        @bacterial_micrograms = ((@bacteria_per_gm * 0.000002))
        self.micrograms = @bacterial_micrograms
    end

    def actino_st_dev_calc
        sum_sqr = @actino_array.map {|x| x * x}.reduce(&:+)
        
        self.actinobacterial_standard_deviation = Math.sqrt((sum_sqr - @actino_length * @actino_mean * @actino_mean)/(@actino_length-1)).round(2)
    end

    def actino_cm_length_calc
        @actino_cm_length = (((@actino_mean * self.actinobacteria_dilution) * self.coverslip)*22)
        self.actinobacteria_length_cm = @actino_cm_length
    end

    def fungi_mean_calc
        @fungi_array = Sample.where(sample_id: sample_id).pluck(:fungi)
        @fungi_array.map!(&:to_f)
        @fungi_length = @fungi_array.length
        @fungi_sum = @fungi_array.sum

        @fungi_mean = @fungi_sum / @fungi_length
        self.fungi_mean = @fungi_mean.round(2)
    end

    def fungi_st_dev_calc
        sum_sqr = @fungi_array.map {|x| x * x}.reduce(&:+)
        
        self.fungi_standard_deviation = Math.sqrt((sum_sqr - @fungi_length * @fungi_mean * @fungi_mean)/(@fungi_length-1)).round(2)
    end

    def fungi_do_not_use_this_row_calc
        # Refers row 26 
        fungi_do_not_use_this_row_calc = self.fungi * self.fungi_diameter
        self.fungi_calculation = fungi_do_not_use_this_row_calc
    end

    def fungi_cm_for_calculation_calc
        # Cell V22
        @fungi_cm_for_calculation_calc = (self.fungi_mean * 0.045)
        self.fungal_cm_length_for_calc = @fungi_cm_for_calculation_calc.round(3)
    end

    def fungal_strands_cm_calc
        # Cell Y21
        @fungal_strands_cm = (((@fungi_cm_for_calculation_calc.round(3) * self.fungi_dilution) * self.coverslip) * 22)
        self.fungal_strands_cm = @fungal_strands_cm
    end

    def fungi_average_diameter_in_um_calc
        # Cell V26
        # Take all the values from the fungi 'do not use this row' calculations
        fungi_do_not_use_this_row_array = Sample.where(sample_id: sample_id).pluck(:fungi_calculation)
        # Remove any nil values so the array can be calculated
        fungi_compact = fungi_do_not_use_this_row_array.compact
        # Add together all the values in the compacted array
        fungi_calc_sum = fungi_compact.sum

        fungi_av_diameter_final = fungi_calc_sum / @fungi_sum
        @fungi_av_di_final = fungi_av_diameter_final.round(1)
        self.fungi_average_diameter_in_um = @fungi_av_di_final
    end

    def fungi_average_diameter_cm_calc
        # Cell W26
        @fungi_av_di_cm = @fungi_av_di_final * 0.0001
        self.fungi_average_diameter_in_cm = @fungi_av_di_cm 
    end

    def oomycetes_mean_calc
        @oomycetes_array = Sample.where(sample_id: sample_id).pluck(:oomycetes)
        @oomycetes_array.map!(&:to_f)
        @oomycetes_length = @oomycetes_array.length
        @oomycetes_sum = @oomycetes_array.sum

        @oomycetes_mean = @oomycetes_sum / @oomycetes_length
        self.oomycetes_mean = @oomycetes_mean
    end

    def oomycetes_st_dev_calc
        sum_sqr = @oomycetes_array.map {|x| x * x}.reduce(&:+)
        
        self.oomycetes_standard_deviation = Math.sqrt((sum_sqr - @oomycetes_length * @oomycetes_mean * @oomycetes_mean)/(@oomycetes_length-1))
    end

    def oomycetes_do_not_use_this_row_calc
        # Refers to row 33 
        oomycetes_do_not_use_this_row_calc = self.oomycetes * self.oomycetes_diameter
        self.oomycetes_calculation = oomycetes_do_not_use_this_row_calc
    end
        
end