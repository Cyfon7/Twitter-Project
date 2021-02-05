class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :tweet
      t.text :content
      t.timestamps
    end
  end
end
