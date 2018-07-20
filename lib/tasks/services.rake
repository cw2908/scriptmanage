namespace :service do
  desc 'Run All Services'
  task run_services: :environment do
    Pservices.list_services.map(&:run)
  end
end