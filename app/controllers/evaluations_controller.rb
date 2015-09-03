class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    
    if current_user.admin?
      @evaluations = Evaluation.all
    else
      @evaluations = Evaluation.uncached do
        Evaluation.rank(:row_order).where(:user_id=>current_user.id, :submitted => false)      
      end
    end
    respond_with(@evaluations)
  end

  def update_row_order
    ahoy.track "Updated Row Order"
    @evaluation = Evaluation.uncached do
      Evaluation.find(evaluation_params[:evaluation_id])
    end
    @evaluation.row_order_position = evaluation_params[:row_order_position]
    @evaluation.save

    render nothing: true # POST action no view rendered
  end

  def save_rankings
    @evaluations = Evaluation.uncached do
     Evaluation.rank(:row_order).where(:user_id=>current_user.id)
   end
     i = 1
     @evaluations.each do |evaluation|
      evaluation.user_rank = i
      evaluation.submitted = true
      evaluation.save
      i += 1
     end
     render "submitted"
  end

  def show
    @evaluation = Evaluation.find(params[:id])
    ahoy.track "Viewed Evaluations", evaluation_id: @evaluation.id
   # @post = Post.where(:id=>@evaluation.post_id)
    respond_with(@evaluation)
  end

  def new
    @evaluation = Evaluation.new
    respond_with(@evaluation)
  end

  def assign
    @users = User.all
    @posts = Post.all
    @users.each do |user|
      if user.admin?
        break
      end
      for i in 1..2
        @post = @posts.sample
        if @post.user_id = user.id
          @post = @posts.sample
        end
          @evaluation = Evaluation.create(:post_id=>@post.id, :user_id=>user.id)
         
      end
    end
    respond_with(@evaluation)
  end

  def edit
    ahoy.track "Edited Evaluation"
   @evaluation = Evaluation.find(params[:id])
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.save
    respond_with(@evaluation)
  end

  def update
    ahoy.track "Updated Evaluation"
    @evaluation.update(evaluation_params)
    respond_with(@evaluation)
  end

  def destroy
    @evaluation.destroy
    respond_with(@evaluation)
  end

  private
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params[:evaluation].permit(:post_id, :user_id, :rating_1, :rating_2, :rating_3, :comment_1, :comment_2, :comment_3, :row_order_position, :user_rank, :evaluation_id)
    end
end
