module Api
    class UsersController < ApiBaseController
        expose :user
        
        # api for rendering users
        def index
            # initialize users
            @users = User.order('id DESC')
            arr_users = []

            # if has search term
            unless params[:search_term].nil? || params[:search_term].empty?
                @users = @users.where("name like '%#{params[:search_term]}%'")
            end
            
            # paginate users
            @users = @users
                .paginate(:page => params[:page])
            
            # prepare json
            @users.each do |user|
                arr_users.push({
                    "id": user.id,
                    "name": user.name,
                    "image_url": url_for(user.image_url.attached? ? user.image_url : "/sb_admin/img/undraw_profile.svg")
                })
            end

            # render json information
            render json: {
                "total_pages" => @users.total_pages,
                "current_page" => @users.current_page,
                "has_next_page" => @users.current_page >= @users.total_pages ? 0 : 1,
                "content" => arr_users.as_json
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

        # get user information
        def show
            render json: {
                "id": user.id,
                "name": user.name,
                "email": user.email,
                "image_url": url_for(user.image_url.attached? ? user.image_url : "/sb_admin/img/undraw_profile.svg")
            }
        end

        # Only allow a trusted parameter "white list" through.
        private
            def user_params
                params.require(:users).permit(:name, :image_url)
            end
    end
end