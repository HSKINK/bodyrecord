FactoryBot.define do
  factory :body_nutrient_fat do
    gender_id      { '1' }
    age            { '40' }
    tall           { '170' }
    n_protein      { '40' }
    n_fat          { '20' }
    n_carbohydrate { '40' }
    goal_body_fat  { '15' }
    day            { '2021/04/01' }
    weight         { '60' }
    body_fat       { '17' }
  end
end
binding.pry
