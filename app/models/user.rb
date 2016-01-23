class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 49}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_senstive: false }
  
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  def admin?
    self.role == 'admin'
  end
end
