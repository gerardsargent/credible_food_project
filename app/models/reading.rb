class Reading < ApplicationRecord

    #Nested resource, parent to samples controller
    has_many :sample

end
