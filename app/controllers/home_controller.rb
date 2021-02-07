class HomeController < ApplicationController
    def index
        
        @tweets = Tweet.order(created_at: :desc).page(params[:page]) #Se ordena en forma descendiente
        if current_user
            @tweet = Tweet.new
            if params[:rt_id]
                @rt_id = params[:rt_id]
            end
        end
    end
end
