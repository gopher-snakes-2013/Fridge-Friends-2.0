class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery

  helper_method :current_fridge

  def current_fridge
    @fridge ||= Fridge.find_by_id(session[:fridge_id])
  end
end