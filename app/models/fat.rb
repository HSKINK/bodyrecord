class Fat < ApplicationRecord

  validates :sex_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :age, presence: true, numericality: { greater_than: 0 }
    validates :height, presence: true, numericality: { greater_than: 0 }
    validates :p, numericality: { in: 0..100 }
    validates :f, numericality: { in: 0..100 }
    validates :c, numericality: { in: 0..100 }
    validates :goal_day, numericality: { greater_than: 0 }
  end

  validates :goal_body_fat, numericality: { greater_than: 0 }, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ }

  belongs_to :user
  has_one :body

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
end
