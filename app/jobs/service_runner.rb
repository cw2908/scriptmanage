class ServiceRunner < ApplicationJob
  queue_as :default
  @queue = :default


  def perform(options)
    named_module = options[:service_name].constantize
    begin
      puts "named_module: #{named_module.inspect}"
      named_module.run(options: options)
    end
  end
end
