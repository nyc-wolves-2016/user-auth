class User < ActiveRecord::Base
  validates :name, presence: true

  has_secure_password
  # Remember to create a migration!
end
