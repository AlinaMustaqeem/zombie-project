FactoryBot.define do
  factory :inventory do
    association :user
    water { Faker::Number.number(digits: 2) }
    pouch { Faker::Number.number(digits: 2) }
    soup { Faker::Number.number(digits: 2) }
    Ak47 { Faker::Number.number(digits: 2) }
    total_qty {Faker::Number.number(digits: 2)}
    trait :invalid_params do
      water { Faker::Name.first_name }
      pouch { Faker::Name.first_name }
      soup { Faker::Name.first_name }
      Ak47 { Faker::Name.first_name }
      total_qty {Faker::Number.number(digits: 2)}
    end
    factory :invalid_params, traits: [:invalid_params]

  end
end
