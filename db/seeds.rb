# frozen_string_literal: true
TradeRequest.destroy_all

Trade.destroy_all

begin
  user = User.new
  user.email = 'admin@devsinc.com'
  user.password = 'admin123'
  user.password_confirmation = 'admin123'
  user.age = 23
  user.name = 'admin'
  user.gender= 'F'
  user.longitude= 22
  user.latitude = 13
  user.user_type = :admin
  user.save!
rescue ActiveRecord::RecordInvalid => invalid
  puts invalid.record.errors.full_messages
end

# TradeRequest.create(coming_request_id: 103, current_reciever_id: 83)

# Trade.create(sending_user_id: 103, recieving_user_id: )
