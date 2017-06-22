class Reading < ApplicationRecord
    belongs_to :user
    has_many :samples
    validates :client, :organisation, :location, :plants_present, :plants_desired, presence: true
end
