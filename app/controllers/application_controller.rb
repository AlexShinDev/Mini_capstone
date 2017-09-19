class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    # ||= is an OR = operator
  end
  helper_method :current_user

  def authenticate_user!
    redirect_user! '/login' unless current_user
  end
end
