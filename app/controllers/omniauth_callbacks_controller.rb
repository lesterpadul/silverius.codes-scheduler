class OmniauthCallbacksController < ApplicationController
    def twitter
        # find user
        auth_user = User.find(current_user.id)

        # update
        @check_update = auth_user.update(twitter_auth_params)

        # redirect
        redirect_to '/users/edit?twitter_linked=1', :notice => "Twitter account has been linked!"
    end
    
    # Only allow a trusted parameter "white list" through.
    def twitter_auth_params
        twitter_auth = request.env['omniauth.auth']
        params[:twitter_token] = twitter_auth.credentials.token
        params[:twitter_secret] = twitter_auth.credentials.secret
        params[:image_url] = twitter_auth.info.image
        params[:name] = twitter_auth.info.name
        params.permit(:twitter_token, :twitter_secret, :image_url, :name)
    end
end