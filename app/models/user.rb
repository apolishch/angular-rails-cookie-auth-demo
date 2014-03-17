require 'pry'

class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  attr_accessor :name, :email

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

end
