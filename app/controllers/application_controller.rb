class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!
	helper_method :logged_in?

  def index
    @auth_token = form_authenticity_token
    @available_services = Pservices.list_services
      .select{|s| s.enabled}
      .map(&:describe)
    puts "@available_services: #{@available_services}"
    @available_services
  end

  def logged_in?
    current_user != nil
  end


  protected
  # def authenticate
  #   # Generic authentication example. Prefer Devise (run devise generator for auth)
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASS']
  #   end
  # end
end
