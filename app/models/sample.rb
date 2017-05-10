class Sample < ApplicationRecord
    before_save :bacterial_mean_calc, :bacterial_st_dev_calc, :actino_mean_calc, :actino_st_dev_calc, :fungi_mean_calc, :fungi_st_dev_calc, :oomycetes_mean_calc, :oomycetes_st_dev_calc #, :bacteria_per_gm_calc
 
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
        self.bacterial_mean = @bacterial_mean
    end

    def bacterial_st_dev_calc
        sum_sqr = @reading_array.map {|x| x * x}.reduce(&:+)
        
        self.bacterial_standard_deviation = Math.sqrt((sum_sqr - @reading_length * @bacterial_mean * @bacterial_mean)/(@reading_length-1))
    end

    # def bacteria_per_gm_calc
    #     self.no_bacteria_per_gram = (((@bacterial_mean * self.bacterial_dilution) * self.coverslip)*22)
    # end

    def actino_mean_calc
        @actino_array = Sample.where(sample_id: sample_id).pluck(:actinobacteria)
        @actino_array.map!(&:to_f)
        @actino_length = @actino_array.length
        @actino_sum = @actino_array.sum

        @actino_mean = @actino_sum / @actino_length
        self.actinobacteria_mean = @actino_mean
    end

    def actino_st_dev_calc
        sum_sqr = @actino_array.map {|x| x * x}.reduce(&:+)
        
        self.actinobacterial_standard_deviation = Math.sqrt((sum_sqr - @actino_length * @actino_mean * @actino_mean)/(@actino_length-1))
    end

    def fungi_mean_calc
        @fungi_array = Sample.where(sample_id: sample_id).pluck(:fungi)
        @fungi_array.map!(&:to_f)
        @fungi_length = @fungi_array.length
        @fungi_sum = @fungi_array.sum

        @fungi_mean = @fungi_sum / @fungi_length
        self.fungi_mean = @fungi_mean
    end

    def fungi_st_dev_calc
        sum_sqr = @fungi_array.map {|x| x * x}.reduce(&:+)
        
        self.fungi_standard_deviation = Math.sqrt((sum_sqr - @fungi_length * @fungi_mean * @fungi_mean)/(@fungi_length-1))
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
        
end