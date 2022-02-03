class BodyNutrientFat
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :gender_id, :age, :tall, :user_id, :protein, :fat, :carbohydrate, :goal_body_fat, :day, :weight,
                :body_fat

  validates :gender_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  with_options format: { with: /\A[0-9]+\z/ } do
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :tall, presence: true, numericality: { greater_than: 0 }
    validates :protein, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :fat, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :carbohydrate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  end
  with_options presence: true, numericality: { greater_than: 0 }, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ } do
    validates :goal_body_fat
    validates :weight
    validates :body_fat
  end
  validates :day, presence: true
  validates :user_id, presence: true

  def save
    body = Body.create(gender_id: gender_id, age: age, tall: tall, user_id: user_id)
    nutrient = Nutrient.create(protein: protein, fat: fat, carbohydrate: carbohydrate, goal_body_fat: goal_body_fat,
                               body_id: body.id)
    Fat.create(day: day, weight: weight, body_fat: body_fat, nutrient_id: nutrient.id)
  end
end
