class Vote < ApplicationRecord
  belongs_to :vote_sent , class_name: "User"
  belongs_to :vote_reciever , class_name: "User"
end
