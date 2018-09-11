module Api::V1
  class ApiController < ActionController::API
    include Concerns::Response
    include Concerns::ExceptionHandler
    # before_action :authenticate_user! # need to implement api auth in v2
      
  end
end