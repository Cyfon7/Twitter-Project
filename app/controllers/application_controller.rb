class ApplicationController < ActionController::Base
    add_flash_types :error_tw, :tweet_errors, :tweet_msg, :search_in_progress
end
