class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :signups
	has_many :exams, through: :signups

	has_many :comments

	def full_name
		"#{first_name} #{last_name}"
	end
end