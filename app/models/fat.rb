class Fat < ApplicationRecord

  # with_options presence: true, numericality: { greater_than: 0, message: "is invalid" }, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ } do
  #   validates :weight
  #   validates :body_fat
  # end

  belongs_to :user
  has_one :body
end
