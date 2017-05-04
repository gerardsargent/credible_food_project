class Sample < ApplicationRecord

    before_create :no_bacteria_per_gram_calc

    def no_bacteria_per_gram_calc
        self.no_bacteria_per_gram = self.bacterial_number + self.actinobacteria
    end
end
