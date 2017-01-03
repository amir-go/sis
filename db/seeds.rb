# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.create(email: 'amir@mail.com', password: 'amir123', password_confirmation: 'amir123', role: 1)

20.times do
	User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end
