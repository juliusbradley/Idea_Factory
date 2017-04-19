class AddUserReferencesToRatings < ActiveRecord::Migration[5.0]
  def change
    add_reference :ratings, :user, index: true
  end
end
