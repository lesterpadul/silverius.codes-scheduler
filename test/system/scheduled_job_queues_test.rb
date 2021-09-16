require "application_system_test_case"

class ScheduledJobQueuesTest < ApplicationSystemTestCase
  setup do
    @scheduled_job_queue = scheduled_job_queues(:one)
  end

  test "visiting the index" do
    visit scheduled_job_queues_url
    assert_selector "h1", text: "Scheduled Job Queues"
  end

  test "creating a Scheduled job queue" do
    visit scheduled_job_queues_url
    click_on "New Scheduled Job Queue"

    fill_in "Schedule", with: @scheduled_job_queue.schedule_id
    fill_in "Schedule type", with: @scheduled_job_queue.schedule_type
    fill_in "Status", with: @scheduled_job_queue.status
    click_on "Create Scheduled job queue"

    assert_text "Scheduled job queue was successfully created"
    click_on "Back"
  end

  test "updating a Scheduled job queue" do
    visit scheduled_job_queues_url
    click_on "Edit", match: :first

    fill_in "Schedule", with: @scheduled_job_queue.schedule_id
    fill_in "Schedule type", with: @scheduled_job_queue.schedule_type
    fill_in "Status", with: @scheduled_job_queue.status
    click_on "Update Scheduled job queue"

    assert_text "Scheduled job queue was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduled job queue" do
    visit scheduled_job_queues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduled job queue was successfully destroyed"
  end
end
