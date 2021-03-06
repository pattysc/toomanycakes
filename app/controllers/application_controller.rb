class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def authorize_user
    unless logged_in?
      redirect_to root_path
    end
  end
end
