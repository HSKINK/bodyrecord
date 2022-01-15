class Body < ApplicationRecord
  # validates :sex_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  # with_options format: { with: /\A[0-9]+\z/ } do
  #   validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, message: "is invalid" }
  #   validates :height, presence: true, numericality: { greater_than: 0, message: "is invalid" }
  #   validates :p, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "is invalid" }
  #   validates :f, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "is invalid" }
  #   validates :c, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "is invalid" }
  #   validates :goal_day, numericality: { greater_than: 0, message: "is invalid" }
  # end

  # validates :goal_body_fat, numericality: { greater_than: 0, message: "is invalid"}, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ }

  belongs_to :fat

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
end
