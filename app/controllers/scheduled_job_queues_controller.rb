class ScheduledJobQueuesController < AdminBaseController
  before_action :set_scheduled_job_queue, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_job_queues
  def index
    @scheduled_job_queues = ScheduledJobQueue.all
  end

  # GET /scheduled_job_queues/1
  def show
  end

  # GET /scheduled_job_queues/new
  def new
    @scheduled_job_queue = ScheduledJobQueue.new
  end

  # GET /scheduled_job_queues/1/edit
  def edit
  end

  # POST /scheduled_job_queues
  def create
    @scheduled_job_queue = ScheduledJobQueue.new(scheduled_job_queue_params)

    if @scheduled_job_queue.save
      redirect_to @scheduled_job_queue, notice: 'Scheduled job queue was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /scheduled_job_queues/1
  def update
    if @scheduled_job_queue.update(scheduled_job_queue_params)
      redirect_to @scheduled_job_queue, notice: 'Scheduled job queue was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scheduled_job_queues/1
  def destroy
    @scheduled_job_queue.destroy
    redirect_to scheduled_job_queues_url, notice: 'Scheduled job queue was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_job_queue
      @scheduled_job_queue = ScheduledJobQueue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_job_queue_params
      params.require(:scheduled_job_queue).permit(:status, :schedule_type, :schedule_id)
    end
end
