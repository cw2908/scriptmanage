class Setting < ApplicationRecord
  has_secure_token :webhook_token


end
