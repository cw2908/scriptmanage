module Pservices
  module ExampleService
    @samanage = Samanage::Api.new(token: ENV['ACCOUNT_TOKEN'])
    @options = {
      service_name: self.to_s
    }

    @form_fields = [
      Pservices::FormField.new(label: 'Date', name: 'start_date', form_type: 'date', value_type: 'date', required: false),
      Pservices::FormField.new(label: 'Type your name', name: 'some_input', form_type: 'input', required: true),
      Pservices::FormField.new(label: 'Select Something', name: 'selected_value', form_type: 'select', options: [{label: 'Choice A', value: 'A'},{label: 'Choice B', value: 'B'},{label: 'Choice C', value: 'C'}], required: true),
      Pservices::FormField.new(label: 'Select Something Different', name: 'other_selection', form_type: 'select', options: [{label: 'Choice 1', value: '1'},{label: 'Choice 2', value: '2'},{label: 'Choice 3', value: '3'}], required: true)
    ]
    def service_name
      @options[:service_name]
    end

    def enabled
      true
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
        expected_output: "Some File",
        account: nil,
      }
    end


    def pre_run(options: {})
      # self.run
      ServiceRunner.perform_later(@options)
    end

    def run(options: {})
      puts "#{self}.run received: #{options}"
    end


    module_function :describe, :pre_run, :run, :service_name, :display_name, :enabled
  end
end