class Like < ApplicationRecord
    belongs_to :user#:publication, polymorphic: true
    belongs_to :tweet

    def self.current_liked(tweet_id, user_id)
        where(tweet_id: tweet_id, user_id: user_id) != []
    end

    def self.current_tweet_like(tweet_id, user_id)
        where(tweet_id: tweet_id, user_id: user_id).last.id        
    end
end
