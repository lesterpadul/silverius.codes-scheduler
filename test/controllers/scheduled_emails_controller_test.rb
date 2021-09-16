require 'test_helper'

class ScheduledEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_email = scheduled_emails(:one)
  end

  test "should get index" do
    get scheduled_emails_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_email_url
    assert_response :success
  end

  test "should create scheduled_email" do
    assert_difference('ScheduledEmail.count') do
      post scheduled_emails_url, params: { scheduled_email: { content_html: @scheduled_email.content_html, content_text: @scheduled_email.content_text, repeating_event: @scheduled_email.repeating_event, scheduled_date: @scheduled_email.scheduled_date, scheduled_time: @scheduled_email.scheduled_time, status: @scheduled_email.status, subject: @scheduled_email.subject } }
    end

    assert_redirected_to scheduled_email_url(ScheduledEmail.last)
  end

  test "should show scheduled_email" do
    get scheduled_email_url(@scheduled_email)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_email_url(@scheduled_email)
    assert_response :success
  end

  test "should update scheduled_email" do
    patch scheduled_email_url(@scheduled_email), params: { scheduled_email: { content_html: @scheduled_email.content_html, content_text: @scheduled_email.content_text, repeating_event: @scheduled_email.repeating_event, scheduled_date: @scheduled_email.scheduled_date, scheduled_time: @scheduled_email.scheduled_time, status: @scheduled_email.status, subject: @scheduled_email.subject } }
    assert_redirected_to scheduled_email_url(@scheduled_email)
  end

  test "should destroy scheduled_email" do
    assert_difference('ScheduledEmail.count', -1) do
      delete scheduled_email_url(@scheduled_email)
    end

    assert_redirected_to scheduled_emails_url
  end
end
