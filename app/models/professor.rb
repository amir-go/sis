class Professor < ActiveRecord::Base
	has_many :exams
	has_many :subjects, through: :exams

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, 
										 default_url: "/images/:style/default_professor_avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates_presence_of :first_name, :last_name, :title

	def full_name
		"#{title} #{first_name} #{last_name}"
	end
end