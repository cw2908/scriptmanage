module Pservices
  module ExampleService
    @samanage = Samanage::Api.new(token: ENV['ACCOUNT_TOKEN'])
    @options = {
      service_name: self.to_s
    }

    @form_fields = [
      Pservices::FormField.new(label: 'Date', name: 'date', form_type: 'date', value_type: 'date', required: true)
    ]
    def service_name
      @options[:service_name]
    end

    def display_name
      'Example Service'
    end

    def describe
      {
        name: display_name,
        service_name: service_name,
        form_fields: @form_fields.to_json,
        description: 'Here to make sure that tests work',
        required_input_fields: [],
        expected_output: "Some FIle",
        account: nil,
      }
    end


    def pre_run(options: {})
      # self.run
      ServiceRunner.perform_later(@options)
    end

    def run(options: {})
      puts "param1: #{options[:param1]}"
      # do something
    end


    module_function :describe, :pre_run, :run, :service_name, :display_name
  end
end