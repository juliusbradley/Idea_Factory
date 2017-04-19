class Rating < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates :body, presence: true
end
