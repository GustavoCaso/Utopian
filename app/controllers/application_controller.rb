class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :friendly_date

  def friendly_date(dt)
    dt.strftime("%d %^b %Y")
  end
end
