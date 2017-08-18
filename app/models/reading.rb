class Reading < ApplicationRecord
    belongs_to :user
    has_many :samples
    validates :client, :organisation, :location, :plants_present, :plants_desired, presence: true

    accepts_nested_attributes_for :samples, allow_destroy: true;
end
