class Api::UsersController < ActionController::Base
    protect_from_forgery with: :null_session
    expose :user
    
    # update function
    def update
        if user.update(user_params)
            render json: {"status" => "ok"}
        else
            render json: {"status" => "ng"}
        end
    end
    
    # Only allow a trusted parameter "white list" through.
    private
        def user_params
            params.require(:users).permit(:name, :image_url)
        end
end