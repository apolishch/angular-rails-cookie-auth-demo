class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  attr_accessor :name, :email

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: {minimum: 6}


end
