require 'minitest/autorun'

describe Pservices do
  it 'exists' do 
    assert_equal(Pservices.class, Module)
  end
  it 'responds to list_services' do 
    assert_respond_to(Pservices, :list_services)
  end
  it 'all services have required methods' do
    Pservices.list_services.map{|s|
      assert_respond_to(s, :describe)
      assert_respond_to(s, :pre_run)
      assert_respond_to(s, :run)
    }
  end
end