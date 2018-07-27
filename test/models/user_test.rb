require 'minitest/autorun'

describe User do
  it "Users can be created" do
    user = User.create(email: 'user@example.com', password: 'pass')
    assert_instance_of(User, user)
  end
  it "Created users must be manually approved" do
    user = User.create(email: 'user@example.com', password: 'pass')
    assert_false(User.approved?)
  end
end
