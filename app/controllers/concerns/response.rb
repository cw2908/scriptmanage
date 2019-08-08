# frozen_string_literal: true

module Concerns
  module Response
    def json_response(payload: {}, status: :ok)
      status = 401 if status == :unauthorized
      puts "Returning a status of #{status.inspect}"
      render json: payload, status: status
    end
  end
end
