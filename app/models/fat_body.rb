class FatBody
  include ActiveModel::Model
  attr_accessor :weight, :body_fat, :user_id, :sex_id, :age, :height, :nutrients_p, :nutrients_f, :nutrients_c, :goal_body_fat, :goal_day, :fat_id

  with_options presence: true, numericality: { greater_than: 0, message: "is invalid" }, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ } do
    validates :weight
    validates :body_fat
  end
  validates :user_id, presence: true

  validates :sex_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  with_options format: { with: /\A[0-9]+\z/ } do
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, message: "is invalid" }
    validates :height, presence: true, numericality: { greater_than: 0, message: "is invalid" }
    validates :nutrients_p, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "is invalid" }
    validates :nutrients_f, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "is invalid" }
    validates :nutrients_c, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "is invalid" }
    validates :goal_day, numericality: { greater_than: 0, message: "is invalid" }
  end
  validates :goal_body_fat, numericality: { greater_than: 0, message: "is invalid"}, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ }
end

def save
  fat = Fat.create(weight: weight, body_fat: body_fat, user_id: user_id)
  Body.create(sex_id: sex_id, age: age, height: height, nutrients_p: nutrients_p , nutrients_f: nutrients_f, nutrients_c: nutrients_c, goal_body_fat: goal_body_fat, goal_day: goal_day, fat_id: fat.id)
end
