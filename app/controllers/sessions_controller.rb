class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:name])
      session[:user_id] = @user.id
      redirect_to show_user_path(@user)
    else
      flash[:notice] = ["Username or Password Invalid"]
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
