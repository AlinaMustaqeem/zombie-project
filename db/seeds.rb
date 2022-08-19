# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Trade.create(sending_user_id: 84, recieving_user_id: 83)

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
