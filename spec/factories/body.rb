FactoryBot.define do
  factory :body do
    gender_id { Faker::Number.between(from: 2, to: 3) }
    age       { '40' }
    tall      { '167' }
    association :user
  end
end