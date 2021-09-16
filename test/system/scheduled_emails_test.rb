require "application_system_test_case"

class ScheduledEmailsTest < ApplicationSystemTestCase
  setup do
    @scheduled_email = scheduled_emails(:one)
  end

  test "visiting the index" do
    visit scheduled_emails_url
    assert_selector "h1", text: "Scheduled Emails"
  end

  test "creating a Scheduled email" do
    visit scheduled_emails_url
    click_on "New Scheduled Email"

    fill_in "Content html", with: @scheduled_email.content_html
    fill_in "Content text", with: @scheduled_email.content_text
    fill_in "Repeating event", with: @scheduled_email.repeating_event
    fill_in "Scheduled date", with: @scheduled_email.scheduled_date
    fill_in "Scheduled time", with: @scheduled_email.scheduled_time
    fill_in "Status", with: @scheduled_email.status
    fill_in "Subject", with: @scheduled_email.subject
    click_on "Create Scheduled email"

    assert_text "Scheduled email was successfully created"
    click_on "Back"
  end

  test "updating a Scheduled email" do
    visit scheduled_emails_url
    click_on "Edit", match: :first

    fill_in "Content html", with: @scheduled_email.content_html
    fill_in "Content text", with: @scheduled_email.content_text
    fill_in "Repeating event", with: @scheduled_email.repeating_event
    fill_in "Scheduled date", with: @scheduled_email.scheduled_date
    fill_in "Scheduled time", with: @scheduled_email.scheduled_time
    fill_in "Status", with: @scheduled_email.status
    fill_in "Subject", with: @scheduled_email.subject
    click_on "Update Scheduled email"

    assert_text "Scheduled email was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduled email" do
    visit scheduled_emails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduled email was successfully destroyed"
  end
end
