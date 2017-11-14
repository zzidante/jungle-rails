class User < ActiveRecord::Base
  has_secure_password  
  has_many :orders
  has_many :reviews

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 4}, presence: true  
  validates :first_name, presence: true
  validates :last_name, presence: true

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return self
    else 
      return nil
    end
  end
end
