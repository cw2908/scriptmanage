class Upload < ApplicationRecord
  belongs_to :user
  has_attached_file :file
  validates_attachment_content_type :file, content_type: /\Acsv\/
end
