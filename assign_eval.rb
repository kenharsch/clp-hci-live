@users = User.where(admin: nil)
@posts = Post.where(problemID: 2)
@users.each do |user|
	post_array = Array.new
	for i in 1..4
		@post = @posts.sample
		if @post.user.group.name = user.group.name
			@post = @posts.sample
		elsif post_array.include?(@post.id)
			@post = @posts.sample
		end
		post_array.push(@post.id)
		Evaluation.create(post_id: @post.id, user_id: user.id)
	end
end
