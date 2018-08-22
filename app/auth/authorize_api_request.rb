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
      if auth_token
        @user ||= User.find(auth_token) 
        @status = 200
      else
        @status = 404
      end
    rescue ActiveRecord::RecordNotFound => e
      @user = nil
      @status = 404
    end
  end

  def auth_token
    puts "http_auth_header: #{http_auth_header.inspect}"
    @auth_token ||= Setting.find_by(webhook_token: http_auth_header) && Setting.find_by(webhook_token: http_auth_header).user
    # @auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
  end
end