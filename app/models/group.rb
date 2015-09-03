class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, :through => :memberships

	def order_posts
		@users = self.users
		@posts = []
		@users.each do |user|
			@posts << user.posts
		end
		return @posts.order(created_at: :desc)
	end
end
