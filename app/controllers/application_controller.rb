class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout :override_auth, if: :devise_controller?
    
    # set protected parameters
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        end

        def override_auth
            if controller_name == "sessions" || controller_name == "registrations"
                if params[:action] == "edit" || params[:action] == "update"
                    "application"
                else
                    "devise"
                end
            end
        end
end
