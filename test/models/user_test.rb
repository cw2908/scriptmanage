# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  approved               :boolean          default(FALSE), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("user"), not null
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_approved              (approved)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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
