class PostUpvote < ActiveRecord::Base
	after_save :increment_upvotes
	after_save :notify


	belongs_to :user
	belongs_to :post

	def increment_upvotes
		@post = self.post
		current_upvotes = @post.upvotes
		@post.update(upvotes: current_upvotes + 1)
	end

	def notify
		@user = self.user
		if @user.real_name.nil?
		name = self.user.nickname.to_s
		else
		name = self.user.name.to_s
		end
		Notification.create(message: name + ' liked your post.', user_notified: self.post.user_id, link: '/'+'posts/'+self.post_id.to_s)
	end
	
end
