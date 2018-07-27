module Pservices
  module AddHardwareSiteDepartment
    @samanage = Samanage::Api.new(token: ENV['ACCOUNT_TOKEN'])
    @options = {
      self: self.to_s
    }
    def describe
      {
        name: 'AddHardwareSiteDepartment',
        description: 'Here to make sure that tests work',
        required_input_fields: [],
        expected_output: "Some FIle",
        account: nil,
      }
    end


    def pre_run(options: {})
      ServiceRunner.perform_later(@options)
    end

    def run(options: {})
      return if Time.now.hour < 2 == 0 && Time.now.minute % 5 == 0
      puts "Starting #{self}"
      @samanage.hardwares(options: {'updated[]': 1, verbose: true}).map do |hardware|
        if DateTime.parse(hardware['updated_at']) > 2.days.ago
          puts "Skipping #{hardware['name']} - #{hardware['id']} - #{hardware['updated_at']}"
          return
        end
        
        email = hardware.dig('username') + '@cpgh.org'
        owner = @samanage.users(options: {email: email}).first
        if owner.nil? || owner.empty? 
          puts "Skipping #{hardware['name']} - #{hardware['id']} - #{hardware['updated_at']}"
          next
        end
				payload = {
					hardware: {
						owner: owner.dig('email') ? {email: email} : nil,
						site: owner.dig('site','name') ? {name: owner.dig('site','name')} : nil,
						department: owner.dig('department','name') ? {name: owner.dig('department','name')} : nil
					}
        }
        ap payload
      @samanage.update_hardware(id: hardware['id'], payload: payload)
      end
    end
    module_function :describe, :pre_run, :run
  end
end