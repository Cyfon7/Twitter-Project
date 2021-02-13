class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_lastest_tweets(num)
    Tweet.last(50)
  end
  
end
