class UsersController < ApplicationController
  def index
    if logged_in?
      redirect_to current_user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to current_user
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :address)
    end
end
