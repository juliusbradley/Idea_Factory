class User < ApplicationRecord

  has_secure_password
has_many :ratings
has_many :ideas
validates :username, presence: true, uniqueness: {case_sensitive: false}
validates :password_digest, presence: true

end
