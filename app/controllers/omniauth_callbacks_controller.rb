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
        params[:name] = twitter_auth.info.name
        params[:twitter_user_name] = twitter_auth.extra.access_token.params[:user_id]
        params.permit(:twitter_token, :twitter_secret, :name, :twitter_user_name)
    end

    def github
        # find user
        auth_user = User.find(current_user.id)

        # update
        @check_update = auth_user.update(github_auth_params)
        
        # redirect
        redirect_to '/users/edit?github_linked=1', :notice => "Github account has been linked!"
    end

    # Only allow a trusted parameter "white list" through.
    def github_auth_params
        github_auth = request.env['omniauth.auth']
        params[:github_token] = github_auth.credentials.token
        params[:github_secret] = github_auth.credentials.secret
        params.permit(:github_token, :github_secret)
    end
end