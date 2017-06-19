class Reading < ApplicationRecord
    belongs_to :user
    has_many :samples
    accepts_nested_attributes_for :samples
end
