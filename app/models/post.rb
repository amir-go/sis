class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    where(nil)
	  end
	end
end