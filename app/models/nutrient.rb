class Nutrient < ApplicationRecord
  has_many :fats
  belongs_to :body
end
