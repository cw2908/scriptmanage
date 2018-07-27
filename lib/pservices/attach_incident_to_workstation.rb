module Pservices
  module AttachIncidentToWorkstation
    @samanage = Samanage::Api.new(token: ENV['ACCOUNT_TOKEN'])
    @options = {
      self: self.to_s
    }
    def describe
      {
        name: 'AttachIncidentToWorkstation',
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
      puts "Starting #{self}"
      @samanage.incidents(options: {'updated[]': 1, verbose: true}).each do |incident|
        asset = incident.dig('custom_fields_values').to_a.select{|cfv| cfv['name'] == 'Workstation Name' && cfv['value'] != ''}.first.to_h
        if asset.empty?
          next
        end
        asset_name = asset.dig('value').to_s.gsub("\u200B",'')
        
        hardware_id = @samanage.hardwares(options: {name: asset_name}).first.to_h.dig('id')
        if hardware_id
          incident_data = { 
            incident: { 
              assets: [{id: hardware_id}] 
            }
          }
          @samanage.update_incident(id: hardware_id, payload: incident_data)
        end
      end
    end
    module_function :describe, :pre_run, :run
  end
end