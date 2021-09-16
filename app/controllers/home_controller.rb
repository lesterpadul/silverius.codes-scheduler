class HomeController < ApplicationController
    before_action :check_auth

    def index
    end
    
    private
    def check_auth
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
end