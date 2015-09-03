class Post < ActiveRecord::Base
	has_paper_trail
	belongs_to :user
	belongs_to :assignment
	has_many :comments
	has_many :evaluations

	validates :assignment_id, presence: { :message => "You must choose an assignment tag."}
	

end
