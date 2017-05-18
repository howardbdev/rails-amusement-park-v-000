class UsersController < ApplicationController

  before_action :get_user, only: [:show, :destroy, :edit]
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      flash[:error] = "Error registering user.  Please try again"
      render :new
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
  end

  def get_user
    @user = User.find_by(id: params[:id])
  end

  def authorize_user
    redirect_to root_path if !logged_in?
  end
end
