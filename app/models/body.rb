class Body < ApplicationRecord
  has_one :nutrient
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
end
