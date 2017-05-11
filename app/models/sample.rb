class Sample < ApplicationRecord

    #Nested resource, child of readings controller
    belongs_to :reading

end
