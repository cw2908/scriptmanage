module Api::V1
  class WebhooksController < ApiController
    include Concerns::Response
    include Concerns::ExceptionHandler
    before_action :authorize_request

    def index
    end

    def create
      @results = {
        message: 'Excellent'
      }
      json_response(@results)
    end

    private
    def webhook_params
      params.require(:webhook)
    end

    def authorize_request
      authorization = AuthorizeApiRequest.new(request.headers).call
      ap authorization
      if authorization[:status] == 404
        json_response({message: 'Unauthorized', status: :unauthorized})
      end
    end
  end
end
