class HomeController < ApplicationController
    def index
        @tweets = Tweet.order(created_at: :desc).page(params[:page]) #Se ordena en forma descendiente
        if current_user
            @tweet = Tweet.new
        end
    end
end
