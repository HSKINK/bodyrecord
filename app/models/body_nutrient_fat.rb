class BodyNutrientFat
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :gender_id, :age, :tall, :user_id, :n_protein, :n_fat, :n_carbohydrate, :goal_body_fat, :day, :weight,
                :body_fat

  validates :gender_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  with_options format: { with: /\A[0-9]+\z/ } do
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :tall, presence: true, numericality: { greater_than: 0 }
    validates :n_protein, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :n_fat, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :n_carbohydrate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  end
  with_options presence: true, numericality: { greater_than: 0 }, format: { with: /\A[0-9]+(\.[0-9]+)?\z/ } do
    validates :goal_body_fat
    validates :weight
    validates :body_fat
  end
  with_options presence: true
    validates :day
    validates :user_id
  end

  def save
    body = Body.create(gender_id: gender_id, age: age, tall: tall, user_id: user_id)
    nutrient = Nutrient.create(n_protein: n_protein, n_fat: n_fat, n_carbohydrate: n_carbohydrate, goal_body_fat: goal_body_fat,
                               body_id: body.id)
    Fat.create(day: day, weight: weight, body_fat: body_fat, nutrient_id: nutrient.id)
  end
end
