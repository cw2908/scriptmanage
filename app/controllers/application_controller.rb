class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate

  def index
  end

  protected
  # def authenticate
  #   # Generic authentication example. Prefer Devise
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV['SPS_ADMIN_U'] && password == ENV['SPS_ADMIN_P']
  #   end
  # end
end
