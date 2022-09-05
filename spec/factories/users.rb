include ActionDispatch::TestProcess

faker_password = Faker::Internet.password(max_length: 6)
FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { faker_password }
    password_confirmation { faker_password }
    user_type { 0 }
    status { 0 }
    age { Faker::Number.between(from: 18, to: 90) }
    longitude { Faker::Number.between(from: -90, to: 90) }
    latitude { Faker::Number.between(from: 1, to: 10) }
    trait :invalid_user do
      name { Faker::Name.first_name  }
      email { Faker::Internet.email }
      password {Faker::Internet.password(max_length: 6)}
      password_confirmation { faker_password }
      user_type { 0 }
      status { 0 }
      age { Faker::Number.between(from: 18, to: 90) }
      longitude { Faker::Number.between(from: -90, to: 90) }
      latitude { Faker::Number.between(from: 1, to: 10) }
    end
    trait :admin do
      user_type { 1 }
    end
    factory :admin, traits: [:admin]
    factory :invalid_user, traits: [:invalid_user]


  end
end
