class Tweet < ApplicationRecord
    has_many :retweets, class_name: "Tweet", foreign_key: "tweet_id"
    belongs_to :tweet, class_name: "Tweet", optional: true
    belongs_to :user
    has_many :likes#, as: :publication
    
    validates :content, presence: true

    scope :tweets_for_me, -> (friend_list) {
        where(user_id: friend_list)
    };

    def self.get_author_name(id)
        find(id).user.name
    end

    def self.get_author_img(id)
        find(id).user.image
    end

    def self.get_id(id)
        find(id).id
    end

    def self.get_created(id)
        find(id).created_at
    end

    def self.get_content(id)
        find(id).content 
    end

end
