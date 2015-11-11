# Filters added to this controller will be run for all controllers in the
# application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper :all # include all helpers, all the time
  protect_from_forgery with: :exception
  before_filter :count_requests_in_session

  def count_requests_in_session
    session[:requests] ||= 0
    session[:requests] += 1
  end
end
