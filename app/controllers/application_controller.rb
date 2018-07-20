class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate

  def index
  end

  protected
  # def authenticate
  #   # Generic authentication example. Prefer Devise (run devise generator for auth)
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASS']
  #   end
  # end
end
