class Idea < ApplicationRecord
  has_many :ratings, dependent: :destroy
belongs_to :user, optional:true
end
