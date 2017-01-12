User.create(email: 'admin@sis.com', password: 'admin123', password_confirmation: 'admin123', role: 1, 
						first_name: 'Amir', last_name: 'Zametica', year: 3, department: 'Software Engineering')
User.create(email: 'moderator@sis.com', password: 'moderator123', password_confirmation: 'moderator123', role: 2, 
						first_name: 'Amer', last_name: 'Buljubasic', year: 2, department: 'Web Development')
User.create(email: 'student@sis.com', password: 'student123', password_confirmation: 'student123', role: 0, 
						first_name: 'Enes', last_name: 'Kapetanovic', year: 1, department: 'Network Development')

20.times do
	User.create(email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, 
							last_name: Faker::Name.last_name, year: 3, department: 'Software Engineering')
end

20.times do
	User.create(email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, 
							last_name: Faker::Name.last_name, year: 2, department: 'Web Development')
end

20.times do
	User.create(email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, 
							last_name: Faker::Name.last_name, year: 1, department: 'Network Development')
end

10.times do
	Professor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
									 email: Faker::Internet.email, title: 'prof.')
end

Subject.create(name: 'Information Technologies', ects: 7, year: 1)
Subject.create(name: 'Programming I', ects: 7, year: 1)
Subject.create(name: 'Math I', ects: 7, year: 1)
Subject.create(name: 'Computer Architecture', ects: 7, year: 1)
Subject.create(name: 'Digital Economy', ects: 2, year: 1)
Subject.create(name: 'Math II', ects: 7, year: 1)
Subject.create(name: 'Programming II', ects: 7, year: 1)
Subject.create(name: 'Operating Systems', ects: 7, year: 1)
Subject.create(name: 'Computer Networks', ects: 6, year: 1)
Subject.create(name: 'English Language I', ects: 3, year: 1)

Subject.create(name: 'Programming III', ects: 7, year: 2)
Subject.create(name: 'Databases I', ects: 7, year: 2)
Subject.create(name: 'Algorithms and Data Structures', ects: 6, year: 2)
Subject.create(name: 'Communication Technologies', ects: 6, year: 2)
Subject.create(name: 'English Language II', ects: 4, year: 2)
Subject.create(name: 'Analysis and Software Design', ects: 7, year: 2)
Subject.create(name: 'Databases II', ects: 7, year: 2)
Subject.create(name: 'Applied Statistics', ects: 6, year: 2)
Subject.create(name: 'Web Development and Design', ects: 7, year: 2)
Subject.create(name: 'English Language III', ects: 6, year: 2)

Subject.create(name: 'Software Development I', ects: 7, year: 3)
Subject.create(name: 'Information Systems Development', ects: 7, year: 3)
Subject.create(name: 'Project Management', ects: 7, year: 3)
Subject.create(name: 'Business Intelligence', ects: 7, year: 3)
Subject.create(name: 'IT Ethics', ects: 2, year: 3)
Subject.create(name: 'Software Development II', ects: 6, year: 3)
Subject.create(name: 'Information Systems Security', ects: 5, year: 3)
Subject.create(name: 'Digital forensics', ects: 5, year: 3)
Subject.create(name: 'User Interface Development', ects: 4, year: 3)
Subject.create(name: 'Final Project', ects: 10, year: 3)

Exam.create(subject_id: 9, professor_id: 1, start_date: '15.2.2017. 12:00', department: 'Network Development')
Exam.create(subject_id: 4, professor_id: 2, start_date: '16.2.2017. 10:00', department: 'Network Development')
Exam.create(subject_id: 8, professor_id: 3, start_date: '17.2.2017. 10:00', department: 'Network Development')
Exam.create(subject_id: 1, professor_id: 4, start_date: '18.2.2017. 14:00', department: 'Network Development')
Exam.create(subject_id: 10, professor_id: 5, start_date: '19.2.2017. 15:00', department: 'Network Development')

Exam.create(subject_id: 11, professor_id: 1, start_date: '15.2.2017. 12:00', department: 'Web Development')
Exam.create(subject_id: 12, professor_id: 2, start_date: '16.2.2017. 10:00', department: 'Web Development')
Exam.create(subject_id: 17, professor_id: 3, start_date: '17.2.2017. 10:00', department: 'Web Development')
Exam.create(subject_id: 16, professor_id: 4, start_date: '18.2.2017. 14:00', department: 'Web Development')
Exam.create(subject_id: 19, professor_id: 5, start_date: '19.2.2017. 15:00', department: 'Web Development')

Exam.create(subject_id: 21, professor_id: 1, start_date: '15.2.2017. 12:00', department: 'Software Engineering')
Exam.create(subject_id: 22, professor_id: 2, start_date: '16.2.2017. 10:00', department: 'Software Engineering')
Exam.create(subject_id: 26, professor_id: 3, start_date: '17.2.2017. 10:00', department: 'Software Engineering')
Exam.create(subject_id: 29, professor_id: 4, start_date: '18.2.2017. 14:00', department: 'Software Engineering')
Exam.create(subject_id: 27, professor_id: 5, start_date: '19.2.2017. 15:00', department: 'Software Engineering')

Evaluation.create(user_id: 1, subject_id: 24, evaluation: 7)
Evaluation.create(user_id: 1, subject_id: 25, evaluation: 6)

Evaluation.create(user_id: 2, subject_id: 13, evaluation: 7)
Evaluation.create(user_id: 2, subject_id: 18, evaluation: 6)

Evaluation.create(user_id: 3, subject_id: 3, evaluation: 7)
Evaluation.create(user_id: 3, subject_id: 5, evaluation: 6)

10.times do
	Post.create(user_id: 1, title: Faker::Lorem.sentence(3, true, 4), description: Faker::Lorem.paragraph(10))
end
10.times do
	Post.create(user_id: 2, title: Faker::Lorem.sentence(3, true, 4), description: Faker::Lorem.paragraph(10))
end
3.times do
	Post.create(user_id: 1, title: Faker::Lorem.sentence(3, true, 4), description: Faker::Lorem.paragraph(10))
end
2.times do
	Post.create(user_id: 2, title: Faker::Lorem.sentence(3, true, 4), description: Faker::Lorem.paragraph(10))
end