class HomeController < ApplicationController
    def index
        
        @tweets_page = Tweet.order(created_at: :desc).page(params[:page]) #Se ordena en forma descendiente
        @tweets = Tweet.all
        if current_user
            @tweet = Tweet.new
        end
    end
end
