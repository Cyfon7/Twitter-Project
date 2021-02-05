class Tweet < ApplicationRecord
    has_many :retweets, class_name: "Tweet", foreign_key: "tweet_id"
    belongs_to :tweet, class_name: "Tweet", optional: true
end