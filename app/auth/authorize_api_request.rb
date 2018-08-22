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
  def status
    @status
  end
  def user
    begin
      if auth_user
        @user ||= auth_user
        @status = 200
      else
        @status = 404
      end
    rescue ActiveRecord::RecordNotFound => e
      @user = nil
      @status = 404
    end
  end

  def auth_user
    if Setting.find_by(webhook_token: http_auth_header) 
      @auth_user ||= User.find(Setting.find_by(webhook_token: http_auth_header).user_id)
    end
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
  end
end