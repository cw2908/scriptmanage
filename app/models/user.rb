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
