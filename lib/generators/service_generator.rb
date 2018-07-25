class Rails::ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates',__FILE__)
  argument :name, type: :string
  class_option :name required: true

  
  def create_services_file
    template 'services.template', "lib/pservices/#{file_name}.rb"
    template 'services_test.template', "test/pservices/#{file_name}_test.rb"
  end

  private 
  def file_name
    name.underscore
  end
end