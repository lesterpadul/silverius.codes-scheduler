class ScheduledEmailsController < ApplicationController
  before_action :set_scheduled_email, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_emails
  def index
    @scheduled_emails = ScheduledEmail.all
  end

  # GET /scheduled_emails/1
  def show
  end

  # GET /scheduled_emails/new
  def new
    @scheduled_email = ScheduledEmail.new
  end

  # GET /scheduled_emails/1/edit
  def edit
  end

  # POST /scheduled_emails
  def create
    @scheduled_email = ScheduledEmail.new(scheduled_email_params)

    if @scheduled_email.save
      redirect_to @scheduled_email, notice: 'Scheduled email was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /scheduled_emails/1
  def update
    if @scheduled_email.update(scheduled_email_params)
      redirect_to @scheduled_email, notice: 'Scheduled email was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scheduled_emails/1
  def destroy
    @scheduled_email.destroy
    redirect_to scheduled_emails_url, notice: 'Scheduled email was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_email
      @scheduled_email = ScheduledEmail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_email_params
      params.require(:scheduled_email).permit(:status, :subject, :content_text, :content_html, :repeating_event, :scheduled_date, :scheduled_time)
    end
end
