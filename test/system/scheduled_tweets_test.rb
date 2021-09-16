require "application_system_test_case"

class ScheduledTweetsTest < ApplicationSystemTestCase
  setup do
    @scheduled_tweet = scheduled_tweets(:one)
  end

  test "visiting the index" do
    visit scheduled_tweets_url
    assert_selector "h1", text: "Scheduled Tweets"
  end

  test "creating a Scheduled tweet" do
    visit scheduled_tweets_url
    click_on "New Scheduled Tweet"

    fill_in "Content", with: @scheduled_tweet.content
    fill_in "Repeating event", with: @scheduled_tweet.repeating_event
    fill_in "Scheduled date", with: @scheduled_tweet.scheduled_date
    fill_in "Scheduled time", with: @scheduled_tweet.scheduled_time
    fill_in "Status", with: @scheduled_tweet.status
    click_on "Create Scheduled tweet"

    assert_text "Scheduled tweet was successfully created"
    click_on "Back"
  end

  test "updating a Scheduled tweet" do
    visit scheduled_tweets_url
    click_on "Edit", match: :first

    fill_in "Content", with: @scheduled_tweet.content
    fill_in "Repeating event", with: @scheduled_tweet.repeating_event
    fill_in "Scheduled date", with: @scheduled_tweet.scheduled_date
    fill_in "Scheduled time", with: @scheduled_tweet.scheduled_time
    fill_in "Status", with: @scheduled_tweet.status
    click_on "Update Scheduled tweet"

    assert_text "Scheduled tweet was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduled tweet" do
    visit scheduled_tweets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduled tweet was successfully destroyed"
  end
end
