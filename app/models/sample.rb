class Sample < ApplicationRecord
    before_save :bacterial_mean_calc, :bacterial_st_dev_calc #, :bacteria_per_gm_calc
 
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
        
end