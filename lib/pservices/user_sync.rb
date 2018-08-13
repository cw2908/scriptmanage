module Pservices
  module UserSync
    @samanage = Samanage::Api.new(token: ENV['ACCOUNT_TOKEN'])
    @options = {
      service_name: self.to_s
    }
    @form_fields = [
      Pservices::FormField.new(
        name: 'File',
        label: 'File',
        form_type: 'file',
        required: true
      )
    ]
    def describe
      {
        name: 'Sync Users',
        service_name: @options[:service_name],
        description: 'Sync users and assigns assets',
        required_input_fields: [],
        form_fields: @form_fields.to_json,
        expected_output: "None",
        account: nil,
      }
    end

    def enabled(options: {})
      true
    end



    def pre_run(options: {})
      # self.run
      # ServiceRunner.perform_later(@options)
    end

    def run(options: {})
      puts "#{self}.run received: #{options}"
    end

    module_function :describe, :pre_run, :run, :enabled
  end
end