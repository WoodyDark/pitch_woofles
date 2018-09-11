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

ActiveRecord::Base.transaction do
  user['email'] = 'owner@example.com'
  user['password'] = '2345'
  User.create(user)
end 



# Seed Feedings
feeding = {}

ActiveRecord::Base.transaction do
  feeding['pet_name'] = 'Molly'
  feeding['pet_birthday'] = '21/11/1995'
  feeding['cleaning_day'] = 'sunday']
  feeding['cleaning_time'] = '10:00:00'
  feeding['feeding_duration'] = [3,4,5,6,7,8].sample
  feeding['automated_feeding']= true
  feeding['notification']= true
  Feeding.create(feeding)
end 



# Email Seeding
email = {}

ActiveRecord::Base.transaction do
  email['email1']='pop@corn.com'
  email['email2']='testy@test.com'
  email['feeding_id']=1
  Email.create(email)

end 



# Feeding Times
time = {}

ActiveRecord::Base.transaction do
  time['feeding_time_1']='10:00:00'
  time['feeding_time_2']='15:00:00'
  time['feeding_time_3']='20:00:00'
  time['feeding_id']=1
  FeedingTime.create(time)
end