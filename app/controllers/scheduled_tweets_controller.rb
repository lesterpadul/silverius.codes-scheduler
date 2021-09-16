class ScheduledTweetsController < AdminBaseController
    before_action :set_scheduled_tweet, only: [:show, :edit, :update, :destroy]
  
    # GET /scheduled_tweets
    def index
        @scheduled_tweets = ScheduledTweet.all.paginate(:page => params[:page])
    end

    # GET /scheduled_tweets/1
    def show
    end

    # GET /scheduled_tweets/new
    def new
        @scheduled_tweet = ScheduledTweet.new
    end

    # GET /scheduled_tweets/1/edit
    def edit
    end

    # POST /scheduled_tweets
    def create
        @scheduled_tweet = ScheduledTweet.new(scheduled_tweet_params)

        if @scheduled_tweet.save
            redirect_to @scheduled_tweet, notice: 'Scheduled tweet was successfully created.'
        else
            render :new
        end
    end

    # PATCH/PUT /scheduled_tweets/1
    def update
        if @scheduled_tweet.update(scheduled_tweet_params)
            redirect_to @scheduled_tweet, notice: 'Scheduled tweet was successfully updated.'
        else
            render :edit
        end
    end

    # DELETE /scheduled_tweets/1
    def destroy
        @scheduled_tweet.destroy
        redirect_to scheduled_tweets_url, notice: 'Scheduled tweet was successfully destroyed.'
    end

    def send_tweet
        # find tweet item
        tweet_item = ScheduledTweet.find(params[:tweet_id])
        
        # send tweet
        TweetJob.perform_later(tweet_item)
        
        # TweetJob.set(wait_until: tweet_item.scheduled_date).perform_later(tweet_item)
        
        # redirect
        return redirect_to scheduled_tweets_path, :notice => "Tweet added to queue!"
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_tweet
        @scheduled_tweet = ScheduledTweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_tweet_params
        params.require(:scheduled_tweet).permit(:status, :content, :repeating_event, :scheduled_date, :scheduled_time)
    end
end
