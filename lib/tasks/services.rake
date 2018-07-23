namespace :service do
  desc 'Run All Services'
  task run: :environment do
    Pservices.list_services.map(&:pre_run)
  end
end