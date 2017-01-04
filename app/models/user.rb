class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :signups
	has_many :exams, through: :signups

	has_many :comments
	has_many :posts

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
end