class UsersController < ApplicationController
  before_action :set_user
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new(user_params)
    end
    if @user.save
      flash[:notice] = "You have successfully created an account"
      session[:user_id] = @user.id
      redirect_to '/'
    else 
      redirect_to '/signup'
    end
  end

  def show
  end

  def destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end


end
