class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
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
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully created an account"
      redirect_to user_path(current_user)
    else 
      flash[:error] = "Something weird happened"
      redirect_to '/signup'
    end
  end

  def show
    @caught_pokemons = @user.caught_pokemons.order("national_id ASC").page(params[:page]).per(10)
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
