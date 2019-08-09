# == Schema Information
#
# Table name: settings
#
#  id                 :bigint           not null, primary key
#  email_alerts       :boolean
#  samanage_api_token :text
#  webhook_token      :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_settings_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require "test_helper"

describe Setting do
  let(:setting) { Setting.new }

  it "must be valid" do
    value(setting).must_be :valid?
  end
end
