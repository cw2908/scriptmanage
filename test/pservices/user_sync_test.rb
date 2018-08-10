require 'minitest/autorun'

describe Pservices::UserSync do
  it 'is a loaded module' do
    assert_equal(Pservices::UserSync.class, Module)
  end
end