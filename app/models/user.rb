class User < ApplicationRecord
  has_one :setting, dependent: :destroy
  after_create :initialize_settings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # User must have approved param manually changed in the database
  def active_for_authentication? 
    super && approved? 
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
