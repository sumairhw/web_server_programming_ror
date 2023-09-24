class SessionsController < ApplicationController
  def new
    # render signup page
  end

  def create
    user = User.find_by username: params[:username]
    if user.present?
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back"
    else
      redirect_to signin_path, notice: "User #{params[:username]} does not exist!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
