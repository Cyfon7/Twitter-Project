class RemoveRecursiveFriendReference < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :friends, :friend_id
    remove_index :friends, name: "index_friends_on_friend_id"
  end
end
