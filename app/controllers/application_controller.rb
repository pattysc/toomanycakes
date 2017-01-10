class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:user]
  end

  def logged_in?
    !!session[:user]
  end

  def authorize_user
    unless logged_in?
      redirect_to root_path
    end
  end
end
