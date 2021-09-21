class EmailJob < ApplicationJob
  queue_as :default

  def perform(email)
    begin
      BatchMailer.with(email).batch_email
    rescue => e
      byebug
    end
  end
end
