class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  after_create :notify

	def notify
		@user = self.user
		if @user.real_name.nil?
		name = self.user.nickname.to_s
		else
		name = self.user.name.to_s
		end
		unless self.user_id == self.post.user_id
			Notification.create(message: name + ' commented on your post ' + self.post.title.to_s, user_notified: self.post.user_id, link: '/'+'posts/'+self.post.id.to_s)
		end
		@post = self.post
		commenters = Array.new
		commenters << @post.user_id
		commenters << self.user_id
		@post.comments.each do |c|
				if !commenters.include?(c.user_id)
					Notification.create(message: name + ' also commented on ' + self.post.title.to_s, user_notified: c.user_id, link: '/'+'posts/'+self.post.id.to_s)
					commenters << c.user_id
				end
		end
	end
end
