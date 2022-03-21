FactoryBot.define do
  factory :nutrient do
    n_protein      { '40' }
    n_fat          { '20' }
    n_carbohydrate { '40' }
    goal_body_fat  { '15' }
    association :body
  end
end
