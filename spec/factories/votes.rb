FactoryBot.define do
  factory :vote do
    association :vote_sent, factory: :user
    association :vote_reciever, factory: :user
  end
end
