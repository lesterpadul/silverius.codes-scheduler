module Api
    class DonationsController < ApiBaseController
        expose :donation
        
        def index
            abort 1.to_s
        end
        
        def show
            render json: {
                'status' => "ok"
            }
        end
        
        def create
           if donation.save
                render json: {
                    'status' => "ok"
                }
           else
                render json: {
                    'status' => "ng"
                }
           end
        end
        
        def donation_history
        end
        
        private
            def donation_params
                params
                    .require(:donation)
                    .permit(:user_id, :target_id, :message, :amount)
            end
    end
end