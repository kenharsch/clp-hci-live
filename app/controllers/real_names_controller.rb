class RealNamesController < ApplicationController
  before_action :set_real_name, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @real_names = RealName.all
    respond_with(@real_names)
  end

  def show
    respond_with(@real_name)
  end

  def new
    @real_name = RealName.new
    respond_with(@real_name)
  end

  def edit
  end

  def create
    @real_name = RealName.new(real_name_params)
    @real_name.save
    redirect_to root_path
  end

  def update
    @real_name.update(real_name_params)
    respond_with(@real_name)
  end

  def destroy
    @real_name.destroy
    respond_with(@real_name)
  end

  private
    def set_real_name
      @real_name = RealName.find(params[:id])
    end

    def real_name_params
      params.require(:real_name).permit(:real, :user_id)
    end
end
