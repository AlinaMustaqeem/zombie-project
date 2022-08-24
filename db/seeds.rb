# frozen_string_literal: true

begin
  user = User.new
  user.email = 'admin@devsinc.com'
  user.password = 'admin123'
  user.password_confirmation = 'admin123'
  user.age = 23
  user.name = 'admin'
  user.gender = 'F'
  user.longitude = 22
  user.latitude = 13
  user.user_type = :admin
  user.save!
rescue ActiveRecord::RecordInvalid => e
  Rails.logger.debug e.record.errors.full_messages
end
