class Reading < ApplicationRecord
    belongs_to :user

    has_many :samples, dependent: :destroy

    validates_presence_of :client, :organisation, :location, :plants_present, :plants_desired

    accepts_nested_attributes_for :samples, allow_destroy: true;
end
