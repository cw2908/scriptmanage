require 'minitest/autorun'

describe Pservices do
  it 'is a loaded module' do 
    assert_equal(Pservices.class, Module)
  end
  it 'responds to list_services' do 
    assert_respond_to(Pservices, :list_services)
  end
  it 'all services have required methods' do
    Pservices.list_services.map{|s|
      assert_respond_to(s, :describe)
      assert_respond_to(s, :pre_run)
      assert_respond_to(s, :enabled)
      assert_respond_to(s, :run)
    }
  end
  it 'all services have Array form_field if enabled' do
    Pservices.list_services
      .select{|s| s.enabled}
      .map{|s|
        assert(s.describe.keys.include?(:form_fields))
        assert_equal(JSON.parse(s.describe[:form_fields]).class, Array)
    }
  end
end