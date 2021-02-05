class AddReferenceTweetOnUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :user, index: true
    add_foreign_key :tweets, :users
  end
end
