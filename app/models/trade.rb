# frozen_string_literal: true

class Trade < ApplicationRecord
  belongs_to :sending_user, class_name: 'User'
  belongs_to :recieving_user, class_name: 'User'

  enum request_status: {
    rejected: 0,
    accepted: 1,
    pending: 2
  }
end
