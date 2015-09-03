class AdminPgController < ApplicationController
  def index
  	@users = User.all.order(:nickname)
  	@posts = Post.all 
  	@comments = Comment.all

  end
end
