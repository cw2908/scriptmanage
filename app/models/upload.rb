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

class Upload < ApplicationRecord
  belongs_to :user
  has_attached_file :file
  validates_attachment_content_type :file, content_type: /\Acsv/
end
