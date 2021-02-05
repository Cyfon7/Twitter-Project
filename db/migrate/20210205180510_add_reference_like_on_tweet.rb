class AddReferenceLikeOnTweet < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :like, index: true
    add_foreign_key :tweets, :likes
  end
end
