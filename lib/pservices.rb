module Pservices
  def self.list_services
    [
     Pservices::ExampleService 
    ]
  end


  def self.write_to_csv(filename: '' , headers: [], row: '', mode: 'a+')
    CSV.open(filename, mode, write_headers: true, force_quotes: true) do |csv| 
      csv << headers if csv.count.eql? 0
      csv << row
    end
  end
end

