class Project < ActiveRecord::Base
	has_paper_trail
	has_many :partnerships
	has_many :users, :through => :partnerships 
	has_many :attachments
end
