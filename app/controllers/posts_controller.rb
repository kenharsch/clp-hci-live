class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if current_user.admin?
      @posts = Post.all
    else
      @posts = Post.where(:user_id=>current_user.id).order(created_at: :desc)
    end
      @assignments = Assignment.all
      @current_assignment = Assignment.where("due >= ?", Time.zone.now).sort_by{|d| d[:due]}.first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
   # @post = Post.new(:user => @current_user)
  end
end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user.id)
    unless @post.user.id == current_user.id
    ahoy.track "Visited Post", post_id: @post.id
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  def new
     @post = Post.new
     @assignments = Assignment.all
    if @post.assignment.nil?
      @assignment = Assignment.where("due >= ?", Time.zone.now).sort_by{|d| d[:due]}.first
    else
      @assignment = @post.assignment
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
 # @post = Post.new(params[:post])
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    if @post.assignment.nil?
      @assignment = Assignment.where("due >= ?", Time.zone.now).sort_by{|d| d[:due]}.first
    else
      @assignment = @post.assignment
    end
    ahoy.track "Edited Post", post_id: @post.id
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.name 
    @post.user_nickname = current_user.nickname 
    if @post.assignment.nil?
      @assignment = Assignment.where("due >= ?", Time.zone.now).sort_by{|d| d[:due]}.first
    else
      @assignment = @post.assignment
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :assignment_id, :content, :grade, :grader, :discussion, :user_id, :user_nickname, :upvotes)
    end
end
