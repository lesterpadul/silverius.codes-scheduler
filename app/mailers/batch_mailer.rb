class BatchMailer < ApplicationMailer
    def batch_email
        @batch_email = params

        # return if does exist
        if !@batch_email
           byebug
           return false
        end
        
        # return if status is already done
        if @batch_email.status != 0
           byebug
           return false
        end
        
        # set delivery options
        delivery_options = { 
            user_name: "padullester@gmail.com",
            password: "ghndvainsqpjicrf",
            address: "smtp.gmail.com" 
        }
        mail_status = mail(
            from: "padullester@gmail.com",
            to: @batch_email.target_emails, 
            subject: @batch_email.subject,
            delivery_method_options: delivery_options
        )
        
        # update information
        @batch_email.status = 2 # done
        
        # save information
        @batch_email.save
    end
end