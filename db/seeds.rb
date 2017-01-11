# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'amir@sis.com', password: 'amir123', password_confirmation: 'amir123', role: 1, 
						first_name: 'Amir', last_name: 'Zametica', year: 3, department: 'WD')

20.times do
	User.create(email: Faker::Internet.email, password: Faker::Internet.password,
							first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, year: 3, department: 'WD')
end

10.times do
	Professor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
										email: Faker::Internet.email, title: 'prof.')
end

10.times do
	Subject.create(name: Faker::Educator.course, ects: 7, year: 3)
end