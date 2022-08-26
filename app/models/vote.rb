# frozen_string_literal: true

class Vote < ApplicationRecord

  belongs_to :vote_sent, class_name: 'User'
  belongs_to :vote_reciever, class_name: 'User'
  scope :votes_count, ->(user) {where(vote_reciever_id: user.id).count}
end

