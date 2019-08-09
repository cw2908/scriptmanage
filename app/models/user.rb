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

class User < ApplicationRecord
  after_create :user_creation_alert
  after_create :initialize_settings
  has_one :setting, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # User must have approved param manually changed in the database
  def active_for_authentication? 
    super && approved? 
  end 

  def user_creation_alert
    if Rails.env.production? || Rails.env.development?
      puts "Sending User Alert for #{self.email}"
      ApplicationMailer.admin_approval(email: self.email).deliver_now
    end
  end
  
  def initialize_settings
    self.setting = Setting.create!(user_id: self.id)
    self.approved = true if !Rails.env.production?
  end
  
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
