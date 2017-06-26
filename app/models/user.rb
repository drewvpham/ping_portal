class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email
  validates :username, :email, uniqueness: { case_sensitive: false }
end
