# frozen_string_literal: true

module Api::V1
  class WebhooksController < ApiController
    include Concerns::Response
    include Concerns::ExceptionHandler
    before_action :authorize_request

    def index
      json_response(payload: {message: "Authorized"})
    end

    def create
      @results = {
        message: 'Excellent'
      }
      json_response(payload: @results)
    end

    private

    def webhook_params
      params.require(:webhook)
    end

    def authorize_request
      authorization = AuthorizeApiRequest.new(request.headers).call
      puts "User tokens: #{User.all.map{|u| u.setting.webhook_token}.join("\n")}"
      puts "authorization: #{authorization.inspect}"
      if authorization[:status] == 401
        json_response(payload: {message: 'Unauthorized'}, status: :unauthorized)
      end
    end
  end
end
