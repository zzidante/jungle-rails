class User < ActiveRecord::Base
  has_secure_password  
  # has_many :products, :orders

  # validates :email, presence: true
  # validates :password_digest, presence: true

end
