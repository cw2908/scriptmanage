# require './app/lib/pservices.rb'

RSpec.describe Pservices do
  it 'is a loaded module' do 
    expect(Pservices.class).to eq(Module)
  end
  describe '#list_services' do
    it 'Returns a list of services' do
      expect(Pservices.list_services).to be_an(Array)
    end
    it 'Each service has the proper methods for view' do
      Pservices.list_services.each do |service|
        expect(service).to respond_to(:describe)
        expect(service).to respond_to(:pre_run)
        expect(service).to respond_to(:enabled)
        expect(service).to respond_to(:run)
      end
    end
  end
end