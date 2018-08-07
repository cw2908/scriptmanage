class ServicesController < ApplicationController
  def index
    puts current_user.inspect
    @auth_token = form_authenticity_token
    @available_services = Pservices.list_services.map(&:describe)
  end

  def create
    myparams = service_params
    puts myparams
    service_name = service_params[:service_name]
    valid_service = Pservices.list_services.include?(service_name.to_s.constantize)
    if valid_service
      begin
        service_options = {service_name: service_name}
        ServiceRunner.perform_later(service_options)
        @response = {message: "Service has been requested", status: 200}
      rescue => e
        @response = {message: "Error: #{e.class}: #{e.inspect}", status: 500}
      end
    else
      @response = {message: "Invalid Service Name", status: 400}
    end
    render json: @response.as_json, status: @response[:status]
  end

  private
  def service_params
    params.require(:service).permit(:service_name,:options)
  end
  
end
