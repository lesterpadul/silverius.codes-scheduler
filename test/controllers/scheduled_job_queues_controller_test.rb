require 'test_helper'

class ScheduledJobQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_job_queue = scheduled_job_queues(:one)
  end

  test "should get index" do
    get scheduled_job_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_job_queue_url
    assert_response :success
  end

  test "should create scheduled_job_queue" do
    assert_difference('ScheduledJobQueue.count') do
      post scheduled_job_queues_url, params: { scheduled_job_queue: { schedule_id: @scheduled_job_queue.schedule_id, schedule_type: @scheduled_job_queue.schedule_type, status: @scheduled_job_queue.status } }
    end

    assert_redirected_to scheduled_job_queue_url(ScheduledJobQueue.last)
  end

  test "should show scheduled_job_queue" do
    get scheduled_job_queue_url(@scheduled_job_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_job_queue_url(@scheduled_job_queue)
    assert_response :success
  end

  test "should update scheduled_job_queue" do
    patch scheduled_job_queue_url(@scheduled_job_queue), params: { scheduled_job_queue: { schedule_id: @scheduled_job_queue.schedule_id, schedule_type: @scheduled_job_queue.schedule_type, status: @scheduled_job_queue.status } }
    assert_redirected_to scheduled_job_queue_url(@scheduled_job_queue)
  end

  test "should destroy scheduled_job_queue" do
    assert_difference('ScheduledJobQueue.count', -1) do
      delete scheduled_job_queue_url(@scheduled_job_queue)
    end

    assert_redirected_to scheduled_job_queues_url
  end
end
