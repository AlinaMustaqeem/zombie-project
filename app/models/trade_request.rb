class TradeRequest < ApplicationRecord
  belongs_to :coming_request, class_name: 'User'
  belongs_to :current_reciever, class_name: 'User'
end
