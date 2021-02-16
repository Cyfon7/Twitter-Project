class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:news, :tweets_btw_dates]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1 or /tweets/1.json
  def show
    @tweets = Tweet.all
    @users = User.all
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
 
    @tweet = Tweet.new(tweet_params)
    
    @tweet.user = current_user
    
    @tweet.generate_hashtag

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path } #, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { redirect_to root_path, flash: { error_tw: true, tweet_errors: @tweet.errors.count, tweet_msg: @tweet.errors.full_messages } } #render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    #API methods
    #Renders a JSON of the last 50 tweets
  def news
    @tweets = Tweet.last(50)

    tweet_record = tweet_to_json(@tweets)

    render json: tweet_record
  end

    #Render a JSON of tweets between 2 dates
  def tweets_btw_dates
    @tweets = Tweet.all
    
    if ( validate_date( params[:date1] ) && validate_date( params[:date2] ) )      
      if  dates_range_ok?( params[:date1], params[:date2] )     

        @tweets = @tweets.tweets_daterange( params[:date1], params[:date2] )
        tweet_record = tweet_to_json(@tweets, true)
        
        render json: tweet_record
      else
        render json: { msg: "Url syntax must be ~/api/<start_date>/<end_date>" }
      end
    else
      render json: { msg: "Date format must be dd-mm-yyyy" }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :tweet_id)
    end

    def validate_date(date)
      date.match?('^\d{2}-\d{2}-\d{4}$')
    end

    def dates_range_ok?(date1, date2)
      date1.to_date <= date2.to_date
    end

    def tweet_to_json(tweets, dates = false)
      if dates
        tweets.map do |tweet|
          {
            id: tweet.id,
            content: tweet.content,
            like_count: tweet.likes.count,
            retweets_count: tweet.retweets.count,
            created_at: tweet.created_at
          }  
        end
      else
        tweets.map do |tweet|
          {
            id: tweet.id,
            content: tweet.content,
            like_count: tweet.likes.count,
            retweets_count: tweet.retweets.count,
            retwitted_from: tweet.tweet_id,
          }  
        end
      end
    end
end
