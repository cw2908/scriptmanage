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
    service_options = {
      service_name: service_name
    }
    begin
      puts "service_options: #{service_options.inspect}"
      puts "valid_service: #{valid_service.inspect}"
      if valid_service
        ServiceRunner.perform_later(service_options)
        @response = {message: "Service has been requested", status: 200}
      else
        @response = {message: "Invalid Service Name", status: 400}
      end
    rescue => e
      @response = {message: "Error: #{e.class}: #{e.inspect}", status: 500}
    end
    ap @response
    render json: @response.as_json, status: @response[:status]
  end
  private

  def service_params
    params.require(:service).permit(:service_name,:options)
  end
end
