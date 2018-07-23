require 'minitest/autorun'

describe User do
  it "Users can be created" do
    user = User.create(email: 'user@example.com', password: 'pass')
    assert_instance_of(User, user)
  end
end
