class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    if current_user.admin?
      @groups = Group.all
    else
      @user = current_user
      @group = @user.group
      @users = @group.users
      @posts = Array.new
      @users.each do |user|
        user.posts.each do |post|
        @posts << post
      end
    end
    @posts.sort! { |a,b| b.updated_at <=> a.updated_at }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    ahoy.track "Visited Group"
    @group = Group.find(params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
    @users = User.all
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end


  def join
    @user = current_user
    @groups = Group.all
    @group = @groups.sample

    if @group.users.nil?

    else
      @count = @group.users.count
      @groups.each do |group|
        if group.users.nil?
          @count = 0
          @group = group
        elsif group.users.count < @count
          @count = group.users.count
          @group = group
        else
          break
        end
      end
    end
    @group.users << @user
    redirect_to groups_path
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :round)
    end
end
