module Pservices



  # Pservices::list_services used: 
  # => lib/tasks/services.rake
  # => test/pservices_test.rb
  def list_services
    [
     Pservices::ExampleService 
    ]
  end


  def write_to_csv(filename: '' , headers: [], row: '', mode: 'a+')
    CSV.open(filename, mode, write_headers: true, force_quotes: true) do |csv| 
      csv << headers if csv.count.eql? 0
      csv << row
    end
  end

  module_function :list_services, :write_to_csv
end

