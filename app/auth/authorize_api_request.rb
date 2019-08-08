# frozen_string_literal: true

class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      user: user,
      status: status
    }
  end

  private

  attr_reader :headers
  attr_reader :status

  def user
    if auth_user
      @user ||= auth_user
      @status = 200
    else
      @status = 401
    end
  rescue ActiveRecord::RecordNotFound => e
    @user = nil
    @status = 401
  end

  def auth_user
    if Setting.find_by(webhook_token: http_auth_header)
      user_exists = User.find(Setting.find_by(webhook_token: http_auth_header).user_id)
      user_approved = user_exists&.approved?
      @auth_user ||= user_exists && user_approved
    end
  end

  def http_auth_header
    if headers['Authorization'].present?
      headers['Authorization'].split(' ').last
    end
  end
end
