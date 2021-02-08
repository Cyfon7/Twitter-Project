class ApplicationController < ActionController::Base
    add_flash_types :error_tw, :tweet_errors, :tweet_msg

    helper_method :calc_time_ago

    def calc_time_ago(created_at)
        actual = Time.now.to_a
        past = created_at.getlocal.to_a
        diff = []
        actual.length.times do |i|
            if i < 6
                diff << actual[i] - past[i]
            else
                diff << actual[i]
            end
        end
        from_time = (diff[0].seconds + diff[1].minutes + diff[2].hours + diff[3].days + diff[4].months + diff[5].years).ago
        time_ago_in_words(from_time)
    end


end
