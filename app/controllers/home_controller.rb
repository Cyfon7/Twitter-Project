class HomeController < ApplicationController

    before_action :set_current_tweet
    def index
        
        @tweets_page = Tweet.order(created_at: :desc).page(params[:page]) #Se ordena en forma descendiente
        @tweets = Tweet.all

    end

    private
    def set_current_tweet
        if current_user
            @tweet = Tweet.new     
        end
    end
end
