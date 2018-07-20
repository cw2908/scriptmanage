module Pservices
  module ExampleService
    def self.describe
      {
        name: 'Example Service',
        description: 'Here to make sure that tests work',
        required_input_fields: [],
        expected_output: "Some FIle",
        account: nil,
      }
    end


    def self.pre_run()
    end

    def self.run()
      puts "Hi"
      @samanage = Samanage::Api.new(token: ENV['STOKEN'])
      ap @samanage.list_admins
    end
  end
end