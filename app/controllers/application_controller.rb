class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper
  def authenticate_user
    redirect_to login_url unless logged_in?
  end
end