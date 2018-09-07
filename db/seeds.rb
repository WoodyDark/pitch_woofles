# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  2.times do 
    user['user_name'] = Faker::Name.first_name 
    user['pet_name'] = Faker::Dog.name
    user['email'] = Faker::Internet.email
    User.create(user)
  end
end 

# Seed Feeding Schedules
umails = []
User.all.each { |u| umails << u.email }
state = ["true", "false"]
feeding = {}
ActiveRecord::Base.transaction do
  3.times do 
  	feeding['feeding_time'] = '08:00:00'
  	feeding['feeding_duration'] = rand(5..11)
  	feeding['email'] = umails
  	feeding['email_opt_out'] = state.sample
  	Feeding.create(feeding)
  end
end