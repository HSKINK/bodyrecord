class Fat < ApplicationRecord

  with_options presence: true, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ } do
    validates :weight
    validates :body_fat
  end

  belongs_to :user
end
