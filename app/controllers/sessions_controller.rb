class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to @user
    else
      flash[:error] = "Invalid credentials.  Please try again or sign up."
      redirect_to '/signin'
    end
  end

  def destroy
    session.clear
    @current_user = nil
    redirect_to root_path
  end
end
