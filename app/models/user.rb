class User < ActiveRecord::Base
  has_secure_password
  validates_prescence_of :username, :password
  validates :username, :email, uniqueness: { case_sensitive: false }
end
