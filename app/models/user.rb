class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, 
  									 default_url: "/images/:style/default_student_avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	has_many :signups
	has_many :exams, through: :signups

	has_many :comments
	has_many :posts

	has_many :evaluations
	has_many :subjects, through: :evaluations

	def full_name
		"#{first_name} #{last_name}"
	end

	def student?
		role == 0
	end

	def admin?
		role == 1
	end

	def moderator?
		role == 2
	end

	def self.search(search)
	  if search
	    where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{search}")
	  else
	    where(nil)
	  end
	end

	def gpa
		evaluations = Evaluation.where(user_id: self.id)

		gpa = 0

		evaluations.each do |e|
			gpa += e.evaluation
		end
		
		gpa.to_d / evaluations.count
	end
end