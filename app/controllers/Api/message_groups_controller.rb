module Api
    class MessageGroupsController < ApiBaseController
        expose :message_group
        
        # api for rendering users
        def index
            # initialize users
            @message_group = MessageGroup.order('message_groups.updated_at DESC')
            arr_message_group = []
            sql_user = "(CASE
                WHEN message_groups.user_id <> #{params["session_id"]} THEN message_groups.user_id
                ELSE 
                    message_groups.receiver_id
            END)"

            # paginate users
            @message_group = @message_group
                .select("
                    message_groups.id,
                    message_groups.message_code,
                    message_groups.updated_at,
                    message_groups.status,
                    users.id as target_user_id,
                    users.name as target_user_name,
                    messages.content as message_content,
                    messages.user_id as message_user_id
                ")
                .joins(
                    "
                        INNER JOIN users
                            ON users.id = #{sql_user}
                    ", 
                    "
                        LEFT JOIN messages
                            ON messages.id = message_groups.last_chat_id
                    "
                )
                .where(
                    "(message_groups.user_id = ? OR  message_groups.receiver_id = ?)", 
                    params["session_id"],
                    params["session_id"]
                )
                .paginate(:page => params[:page])
            
            # check if has search term
            unless params[:search_term].nil? || params[:search_term].empty?
                @message_group = @message_group.where("(users.name LIKE '%#{params[:search_term].to_s}%')")
            end
            
            # prepare json
            @message_group.each do |message|
                arr_message_group.push({
                    "user": {
                        "id": message.target_user_id,
                        "name": message.target_user_name,
                    },
                    "message_group": {
                        "message_code": message.message_code,
                        "updated_at": message.updated_at
                    },
                    "message": {
                        "content": message.message_content,
                        "user_id": message.message_user_id
                    }
                })
            end
            
            # render json information
            render json: {
                "total_pages" => @message_group.total_pages,
                "current_page" => @message_group.current_page,
                "has_next_page" => @message_group.current_page >= @message_group.total_pages ? 0 : 1,
                "content" => arr_message_group.as_json
            }
        end

        # api for creating message groups
        def create
            # check message check
            message_check = MessageGroup
                .where(
                    "
                        (user_id = ? AND receiver_id = ?)
                        OR (user_id = ? AND receiver_id = ?)
                    ", 
                    message_group_params[:user_id],
                    message_group_params[:receiver_id],
                    message_group_params[:receiver_id],
                    message_group_params[:user_id]
                )
                .first
            
            # if has message check
            if message_check
                return render json: {
                    "status" => "ok",
                    "content" => MessageGroupsSerializer.new(message_check).as_json
                }
            end

            # render json information
            if message_group.save
                render json: {
                    "status" => "ok",
                    "content" => MessageGroupsSerializer.new(message_group).as_json
                }
            else
                render json: {
                    "status" => "ng"
                }
            end
        end

        # Only allow a trusted parameter "white list" through.
        private
            def message_group_params
                params.require(:message_groups).permit(:user_id, :receiver_id)
            end
    end
end