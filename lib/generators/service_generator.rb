class Rails::ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates',__FILE__)
  argument :name, type: :string

  
  def create_services_file
    copy_file 'services.rb', "lib/pservices/#{file_name}.rb"
    copy_file 'services_test.rb', "test/pservices/#{file_name}_test.rb"
  end

  private 
  def file_name
    name.underscore
  end
end