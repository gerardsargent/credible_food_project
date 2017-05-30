class Reading < ApplicationRecord

    validates :land_name, presence: true,
                            length: {minimum: 1}

    validates :crop_growing, presence: true,
                            length: {minimum: 1}
                            
end
