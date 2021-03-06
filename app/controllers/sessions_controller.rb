class SessionsController < ApplicationController
 
  def new
  end

  def create
    @user = User.find_by_username(user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:map_state] = nil
    session[:user_id] = nil
    redirect_to '/'
  end

private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
