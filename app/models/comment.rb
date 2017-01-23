class Comment < ActiveRecord::Base
	has_ancestry
	
	belongs_to :user
	belongs_to :post

	validates :content, presence: true
end