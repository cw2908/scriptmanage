class ServiceRunner < ApplicationJob
  queue_as :default
  @queue = :default


  def perform(options)
    named_module = options[:self].constantize
    named_module.run(options: options)
  end
end
