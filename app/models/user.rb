class User < ApplicationRecord

  has_secure_password
has_many :ratings
has_many :ideas
has_many :likes, dependent: :destroy
has_many :liked_ideas, through: :likes, source: :idea
validates :username, presence: true, uniqueness: {case_sensitive: false}
validates :password_digest, presence: true

end
