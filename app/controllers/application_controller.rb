class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery

  helper_method :current_user
end
