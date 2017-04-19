class AddRatingsToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_reference :ratings, :idea, index: true
  end
end
