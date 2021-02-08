class HomeController < ApplicationController

    before_action :set_current_tweet
    def index
        if current_user
            @tweets_page = Tweet.tweets_for_me(set_list_friends).order(created_at: :desc).page(params[:page]) #Se ordena en forma descendiente
        else
            @tweets_page = Tweet.order(created_at: :desc).page(params[:page]) #Se ordena en forma descendiente
        end
        @tweets = Tweet.all

    end

    private
    def set_current_tweet
        if current_user
            @tweet = Tweet.new     
        end
    end

    def set_list_friends
        current_user.friends.pluck(:friend_id).reject{ |v| v == nil }
    end
end
