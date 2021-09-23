module Api
    class UsersController < ApiBaseController
        expose :user
        
        # api for rendering users
        def index
            # initialize users
            @users = User.order('id DESC')

            # if has search term
            unless params[:search_term].nil? || params[:search_term].empty?
                @users = @users.where("name like '%#{params[:search_term]}%'")
            end
            
            # paginate users
            @users = @users
                .paginate(:page => params[:page])
            
            # render json information
            render json: {
                "total_pages" => @users.total_pages,
                "current_page" => @users.current_page,
                "has_next_page" => @users.current_page >= @users.total_pages ? 0 : 1,
                "users" => []
            }
        end
        
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
end