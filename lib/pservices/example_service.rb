module Pservices
  module ExampleService
    @samanage = Samanage::Api.new(token: ENV['STOKEN'])
    @options = {
      self: self.to_s
    }
    def self.describe
      {
        name: 'Example Service',
        description: 'Here to make sure that tests work',
        required_input_fields: [],
        expected_output: "Some File",
        account: nil,
      }
    end


    def self.pre_run(options: {})
      @options.merge!({param1: 'test'})
      ServiceRunner.perform_later(@options)
    end

    def self.run(options: {})
      puts "param1: #{options[:param1]}"
      # do something
    end
  end
end