class Reading < ApplicationRecord
    belongs_to :user
    has_many :samples
end
