class Body < ApplicationRecord

  with_options presence: true, numericality: { greater_than: 0 }, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ } do
    validates :weight
    validates :body_fat
  end

  belongs_to :fat
end
