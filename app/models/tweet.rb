class Tweet < ApplicationRecord
    has_many :retweets, class_name: "Tweet", foreign_key: "tweet_id"
    belongs_to :tweet, class_name: "Tweet", optional: true
    belongs_to :user
    has_many :likes#, as: :publication
    
    scope :rt_counter, -> (tweet) {
        self.where(tweet_id: tweet.id).count
    }
    
end
