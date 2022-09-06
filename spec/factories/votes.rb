FactoryBot.define do
  factory :vote do
    association :vote_sent
    association :vote_reciever
  end
end
