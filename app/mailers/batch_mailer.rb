class BatchMailer < ApplicationMailer
    def batch_email
        @batch_email = params
        delivery_options = { 
            user_name: "padullester@gmail.com",
            password: "ghndvainsqpjicrf",
            address: "smtp.gmail.com" 
        }
        return mail(
            from: "padullester@gmail.com",
            to: @batch_email.target_emails, 
            subject: @batch_email.subject,
            delivery_method_options: delivery_options
        )
    end
end