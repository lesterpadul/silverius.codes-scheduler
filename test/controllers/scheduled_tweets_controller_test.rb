require 'test_helper'

class ScheduledTweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_tweet = scheduled_tweets(:one)
  end

  test "should get index" do
    get scheduled_tweets_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_tweet_url
    assert_response :success
  end

  test "should create scheduled_tweet" do
    assert_difference('ScheduledTweet.count') do
      post scheduled_tweets_url, params: { scheduled_tweet: { content: @scheduled_tweet.content, repeating_event: @scheduled_tweet.repeating_event, scheduled_date: @scheduled_tweet.scheduled_date, scheduled_time: @scheduled_tweet.scheduled_time, status: @scheduled_tweet.status } }
    end

    assert_redirected_to scheduled_tweet_url(ScheduledTweet.last)
  end

  test "should show scheduled_tweet" do
    get scheduled_tweet_url(@scheduled_tweet)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_tweet_url(@scheduled_tweet)
    assert_response :success
  end

  test "should update scheduled_tweet" do
    patch scheduled_tweet_url(@scheduled_tweet), params: { scheduled_tweet: { content: @scheduled_tweet.content, repeating_event: @scheduled_tweet.repeating_event, scheduled_date: @scheduled_tweet.scheduled_date, scheduled_time: @scheduled_tweet.scheduled_time, status: @scheduled_tweet.status } }
    assert_redirected_to scheduled_tweet_url(@scheduled_tweet)
  end

  test "should destroy scheduled_tweet" do
    assert_difference('ScheduledTweet.count', -1) do
      delete scheduled_tweet_url(@scheduled_tweet)
    end

    assert_redirected_to scheduled_tweets_url
  end
end
