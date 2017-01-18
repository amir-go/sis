class Evaluation < ActiveRecord::Base
	before_create :check_exists?

	belongs_to :user
	belongs_to :subject

	validates :evaluation, presence: true, numericality: true

	def check_exists?
		if Evaluation.find_by_user_id(self.user_id) != nil && Evaluation.find_by_subject_id(self.subject_id) != nil
			return false
		else
			return true
		end
	end

	def self.search(search)
	  if search
	    where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{search}")
	  else
	    where(nil)
	  end
	end
end