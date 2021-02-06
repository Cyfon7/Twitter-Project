class HomeController < ApplicationController
    def index
        @tweets = Tweet.order(created_at: :desc).page(params[:page]) #Se ordena en forma descendiente
        @tweet = Tweet.new
        @likes = Like.all
    end
end
