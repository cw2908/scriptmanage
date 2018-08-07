class ServicesController < ApplicationController
  def index
    puts current_user.inspect
    @auth_token = form_authenticity_token
    @available_services = Pservices.list_services.map(&:describe)
    ap flash
    puts "flash: #{flash.inspect}"
  end

  def create
    myparams = service_params
    puts myparams
    service_options = {
      self: service_params[:name]
    }
    begin
      ServiceRunner.perform_later(service_options)
      flash_message = {success: "Queueing #{service_params[:name]}"}
    rescue => e
      flash_message = {error: "Error: #{e.class}: #{e.inspect}"}
    end
    redirect_to services_path, flash: flash_message
  end
  private

  def service_params
    params.require(:service).permit(:name,:options)
  end
end
