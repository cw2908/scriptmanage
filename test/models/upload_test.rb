# == Schema Information
#
# Table name: uploads
#
#  id                :bigint           not null, primary key
#  attachment_type   :string           not null
#  file_content_type :string           not null
#  file_file_name    :string           not null
#  file_file_size    :bigint           not null
#  file_updated_at   :datetime         not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require "test_helper"

describe Upload do
  let(:upload) { Upload.new }

  it "must be valid" do
    value(upload).must_be :valid?
  end
end
