class ScheduledTweetsController < AdminBaseController
    before_action :set_scheduled_tweet, only: [:show, :edit, :update, :destroy]

    # GET /scheduled_tweets
    def index
        @scheduled_tweets = ScheduledTweet
            .where("user_id = ?", current_user.id)
            .order('id DESC').paginate(:page => params[:page])
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
            # set var
            tweet_item = @scheduled_tweet

            # set the scheduled time
            scheduled_time = Date.new(tweet_item.scheduled_date.year,tweet_item.scheduled_date.month,tweet_item.scheduled_date.day) +  Time.parse(tweet_item.scheduled_time.to_s(:time)).seconds_since_midnight.seconds

            # set the alternative
            TweetJob.set(wait_until: scheduled_time).perform_later(tweet_item)
            
            # redirect!
            redirect_to @scheduled_tweet, notice: 'Scheduled tweet was successfully created.'
        else
            render :new
        end
    end

    # PATCH/PUT /scheduled_tweets/1
    def update
        if @scheduled_tweet.update(scheduled_tweet_params)
            # set var
            tweet_item = @scheduled_tweet
            
            # set the scheduled time
            scheduled_time = Date.new(tweet_item.scheduled_date.year,tweet_item.scheduled_date.month,tweet_item.scheduled_date.day) +  Time.parse(tweet_item.scheduled_time.to_s(:time)).seconds_since_midnight.seconds
            
            # set the alternative
            TweetJob.set(wait_until: scheduled_time).perform_later(tweet_item)
            
            # redirect!
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
        
        # check if tweet was sent!
        @send_tweet_resp = User::send_tweet(tweet_item)
        response_message = "Tweet was released into the wild!"
        
        # if this is false
        unless @send_tweet_resp != false
            response_message = "Cannot resend tweet! Please make a new job!"
        end
        
        # redirect
        return redirect_to scheduled_tweets_path, :notice => response_message
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_tweet
        @scheduled_tweet = ScheduledTweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_tweet_params
        params.require(:scheduled_tweet).permit(:status, :content, :repeating_event, :scheduled_date, :scheduled_time, :user_id)
    end
end
