module Pservices



  # Pservices::list_services used: 
  # => lib/tasks/services.rake
  # => test/pservices_test.rb
  def list_services
    [
      Pservices::AttachIncidentToWorkstation,
			Pservices::AddHardwareSiteDepartment,
      Pservices::ExampleService 
    ]
  end


  def write_to_csv(filename: '' , headers: [], row: '', mode: 'a')
    write_headers = !File.exists?(filename)
    CSV.open(filename, mode, write_headers: write_headers, headers: headers, force_quotes: true) do |csv| 
      csv << row
    end
  end

  module_function :list_services, :write_to_csv
end

