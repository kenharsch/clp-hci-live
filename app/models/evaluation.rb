class Evaluation < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	include RankedModel
	ranks :row_order
	
end
