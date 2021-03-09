class ApplicationController < ActionController::Base
    #protect_from_forgery with: :exception
    protect_from_forgery unless: -> { request.format.json? }
    before_action :authenticate_user!
    
    add_flash_types :error_tw, :tweet_errors, :tweet_msg, :search_in_progress
end
