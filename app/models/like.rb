class Like < ApplicationRecord
    belongs_to :user#:publication, polymorphic: true
    belongs_to :tweet

    scope :like_counter, -> (tweet) {
        self.where(tweet_id: tweet.id).count
    }
end
