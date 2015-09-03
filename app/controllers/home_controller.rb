class HomeController < ApplicationController
  def index

    if current_user.group.nil?
      @groups = Group.all
      @user = current_user
      @group = @groups.sample
      @group.users << @user
      @user.save
      @users = @group.users
    elsif current_user.admin?
      @groups = Group.all
      @users = User.all
    else
      @user = current_user
      @group = @user.group
      @users = @group.users
    end

    @posts = Array.new
    @comments = Array.new
    @users.each do |user|
      user.posts.each do |post|
        @posts << post
        post.comments.each do |comment|
          @comments << comment
        end
      end
    end


    @assignment = Assignment.where("due >= ?", Time.zone.now).sort_by{|d| d[:due]}.first
    unless @assignment.nil?
    @assignment_link = '/'+'assignments/'+ @assignment.id.to_s
    end
    unless @posts.count == 0
      @newest = @posts.sort_by{|p| p[:updated_at]}.last
      @newest_link = '/'+'posts/'+ @newest.id.to_s

      @new_comment = @comments.sort_by{|p| p[:updated_at]}.last
      if @new_comment.nil?
        @trending = Post.first
      else
        @trending = @new_comment.post
      end
      @trending_link = '/'+'posts/'+ @trending.id.to_s
      @notifications = Notification.where(user_notified: [0, current_user.id]).order('created_at DESC')
      @gold_star_posts = Array.new
      @gold_stars = PostUpvote.joins(:user).where(:users => {:admin => true})
      @gold_stars.each do |gs|
        @gold_star_posts << gs.post
      end
      @gold_star_posts.sort_by{|t| t[:created_at]}
      @gold_star_posts.reverse!
    end
  end

  end
