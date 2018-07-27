require 'minitest/autorun'

describe Pservices::AttachIncidentToWorkstation do
  it 'is a loaded module' do
    assert_equal(Pservices::AttachIncidentToWorkstation.class, Module)
  end
end