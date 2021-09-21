class ScheduledEmailsController < AdminBaseController
  before_action :set_scheduled_email, only: [:show, :edit, :update, :destroy, :new]
  before_action :set_common_view_name
  expose :scheduled_emails, build_params: :scheduled_email_params
  expose :scheduled_emails_deactivated, -> { ScheduledEmail.where('status = ?', 0) }
  expose :scheduled_email

  # GET /scheduled_emails
  def index
    @scheduled_emails = ScheduledEmail.order('id DESC')

    unless params[:subject].nil? || params[:subject].empty?
        @scheduled_emails = @scheduled_emails.where("subject like '%#{params[:subject]}%'")
    end

    unless params[:status].nil? || params[:status].empty?
        @scheduled_emails = @scheduled_emails.where("status = ?", params[:status])
    end
    
    @scheduled_emails = @scheduled_emails.where("user_id = ?", current_user.id)
      .paginate(:page => params[:page])
  end
  
  # GET /scheduled_emails/1
  def show
  end

  # GET /scheduled_emails/new
  def new
  end

  # GET /scheduled_emails/1/edit
  def edit
  end

  def send_email
    mail_status = BatchMailer.with(scheduled_email).batch_email
    config.log_level = :warn
    logger.debug "EMAIL DEBUG ---------- \n #{mail_status} \n EMAIL DEBUG ---------- \n "
    redirect_to scheduled_emails_path, notice: 'Email sent!'
  end
  
  # POST /scheduled_emails
  def create
    if scheduled_emails.save

      # set the scheduled time
      scheduled_time = Date.new(
        scheduled_emails.scheduled_date.year,
        scheduled_emails.scheduled_date.month,
        scheduled_emails.scheduled_date.day) + Time.parse(scheduled_emails.scheduled_time.to_s(:time)).seconds_since_midnight.seconds
      
      # set the alternative
      EmailJob.set(wait_until: scheduled_time).perform_later(scheduled_emails)
      
      # redirect to
      redirect_to scheduled_emails, notice: 'Scheduled email was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /scheduled_emails/1
  def update
    if scheduled_emails.update(scheduled_email_params)
      # set the scheduled time
      scheduled_time = Date.new(
        scheduled_emails.scheduled_date.year,
        scheduled_emails.scheduled_date.month,
        scheduled_emails.scheduled_date.day) + Time.parse(scheduled_emails.scheduled_time.to_s(:time)).seconds_since_midnight.seconds
      
      # set the alternative
      EmailJob.set(wait_until: scheduled_time).perform_later(scheduled_emails)
      
      # redirect to
      redirect_to scheduled_emails, notice: 'Scheduled email was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scheduled_emails/1
  def destroy
    scheduled_emails.destroy
    redirect_to scheduled_emails_url, notice: 'Scheduled email was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_email
      @scheduled_email = scheduled_emails
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_email_params
      params.require(:scheduled_email).permit(:status, :subject, :content_text, :content_html, :repeating_event, :scheduled_date, :scheduled_time, :user_id, :target_emails)
    end

    # set common view name
    def set_common_view_name
      @view_name = "scheduled_tweets"
      @params = params
    end
end
