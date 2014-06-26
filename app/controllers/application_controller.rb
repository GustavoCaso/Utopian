class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :friendly_date, :login?, :current_user

  def friendly_date(dt)
    dt.strftime("%d %^b %Y")
  end

  def login?
    !!current_user
  end

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless login?
      redirect_to signin_path, notice: "You must be Log in to acces that place"
    end
  end
end
