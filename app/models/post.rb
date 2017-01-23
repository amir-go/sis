class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates_presence_of :title, :description

	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    where(nil)
	  end
	end
end