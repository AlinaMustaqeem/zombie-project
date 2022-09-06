FactoryBot.define do
  factory :inventory do
    association :user
    water { Faker::Number.number(digits: 2) }
    pouch { Faker::Number.number(digits: 2) }
    soup { Faker::Number.number(digits: 2) }
    Ak47 { Faker::Number.number(digits: 2) }
    total_qty {Faker::Number.number(digits: 2)}
  end
end
