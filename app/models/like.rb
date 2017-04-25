class Like < ApplicationRecord
belongs_to :user
belongs_to :idea

#the following validation guarantees that the user can only like
#a question once
validates :user_id, uniqueness: {scope: :idea_id}
end
