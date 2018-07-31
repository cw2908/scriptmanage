class Rails::ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates',__FILE__)
  argument :name, type: :string
  # class_option :name required: true

  
  def create_services_file
    template 'services.template', "lib/pservices/#{file_name}.rb"
    template 'services_test.template', "test/pservices/#{file_name}_test.rb"
  end

  def append_services
    log 'append_services', name.singularize.camelcase
    sentinel = 'def list_services
    ['
  
    in_root do
      gsub_file 'lib/pservices.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n\t\t\tPservices::#{name.singularize.camelcase},"
      end
    end
  end
  



  private 
  def file_name
    name.underscore
  end
end