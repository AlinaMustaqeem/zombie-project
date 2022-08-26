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
  user.image.attach(io: File.open(Rails.root.join(*%w[app assets images p1.jpg])),
  filename: 'p1.jpg', content_type: 'image/jpg')
  user.save!
rescue ActiveRecord::RecordInvalid => invalid
  puts invalid.record.errors.full_messages
end
