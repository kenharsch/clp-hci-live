class PostUpvotesController < ApplicationController
  before_action :set_post_upvote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @post_upvotes = PostUpvote.all
  end

  def show
  end

  def new
    @post_upvote = PostUpvote.new
  end

  def edit
  end

  def create
     @post_upvote = PostUpvote.new(post_upvote_params)

    respond_to do |format|
      if @post_upvote.save
        format.html { redirect_to @post_upvote.post, notice: 'Post upvote was successfully created.' }
        format.json { render :show, status: :created, location: @post_upvote }
      else
        format.html { render :new }
        format.json { render json: @post_upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
   respond_to do |format|
      if @post_upvote.update(post_upvote_params)
        format.html { redirect_to @post_upvote, notice: 'Post upvote was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_upvote }
      else
        format.html { render :edit }
        format.json { render json: @post_upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post_upvote.destroy
    respond_to do |format|
      format.html { redirect_to post_upvotes_url, notice: 'Post upvote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post_upvote
      @post_upvote = PostUpvote.find(params[:id])
    end

    def post_upvote_params
      params.require(:post_upvote).permit(:user_id, :post_id)
    end
end
