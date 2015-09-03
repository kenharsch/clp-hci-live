class CommentUpvotesController < ApplicationController
  before_action :set_comment_upvote, only: [:show, :edit, :update, :destroy]

  # GET /comment_upvotes
  # GET /comment_upvotes.json
  def index
    @comment_upvotes = CommentUpvote.all
  end

  # GET /comment_upvotes/1
  # GET /comment_upvotes/1.json
  def show
  end

  # GET /comment_upvotes/new
  def new
    @comment_upvote = CommentUpvote.new
  end

  # GET /comment_upvotes/1/edit
  def edit
  end

  # POST /comment_upvotes
  # POST /comment_upvotes.json
  def create
    @comment_upvote = CommentUpvote.new(comment_upvote_params)

    respond_to do |format|
      if @comment_upvote.save
        format.html { redirect_to @comment_upvote, notice: 'Comment upvote was successfully created.' }
        format.json { render :show, status: :created, location: @comment_upvote }
      else
        format.html { render :new }
        format.json { render json: @comment_upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_upvotes/1
  # PATCH/PUT /comment_upvotes/1.json
  def update
    respond_to do |format|
      if @comment_upvote.update(comment_upvote_params)
        format.html { redirect_to @comment_upvote, notice: 'Comment upvote was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_upvote }
      else
        format.html { render :edit }
        format.json { render json: @comment_upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_upvotes/1
  # DELETE /comment_upvotes/1.json
  def destroy
    @comment_upvote.destroy
    respond_to do |format|
      format.html { redirect_to comment_upvotes_url, notice: 'Comment upvote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_upvote
      @comment_upvote = CommentUpvote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_upvote_params
      params.require(:comment_upvote).permit(:user_id, :comment_id)
    end
end
