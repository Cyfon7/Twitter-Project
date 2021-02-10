class HomeController < ApplicationController

    before_action :set_current_tweet
    def index
        @tweets = Tweet.all
        if current_user
            @tweets_consult= Tweet.tweets_for_me(set_list_friends)
        else
            @tweets_consult = Tweet.all
        end
    
        if ( flash[:search_in_progress] && ( params[:search] != "" ) )

            @tweets_searched = @tweets_consult.where("content Like ?", "%#{params[:search]}%")
            flash[:search_in_progress] = false
            @tweets_consult = @tweets_searched
            params[:search] = ""
        end

        #Descendent Order + Pagination
        @tweets_page = @tweets_consult.order(created_at: :desc).page(params[:page])
        

    end

    def do_search
        respond_to do |format|
            format.html { redirect_to root_path(search: params[:search]), flash: { search_in_progress: true }}
        end
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
