module Api
    class MessagesController < ApiBaseController
        expose :message
        
        # api for rendering users
        def show
            # initialize users
            @messages = Message.order('messages.id DESC')
            arr_messages = []

            # paginate users
            @messages = @messages
                .select("
                    users.id as target_user_id,
                    users.name as target_user_name,
                    messages.id as message_id,
                    messages.content as message_content,
                    messages.user_id as message_user_id,
                    messages.status,
                    messages.created_at as message_created_at
                ")
                .where("message_code = ?", params[:id])
                .joins("
                    INNER JOIN users
                        ON users.id = messages.user_id
                ")
                .paginate(:page => params[:page])
            
            # prepare json
            @messages.each do |message|
                arr_messages.push({
                    "user": {
                        "id": message.target_user_id,
                        "name": message.target_user_name
                    },
                    "message": {
                        "id": message.message_id,
                        "content": message.message_content,
                        "user_id": message.message_user_id,
                        "created_at": message.message_created_at,
                    }
                })
            end

            # render json information
            render json: {
                "total_pages" => @messages.total_pages,
                "current_page" => @messages.current_page,
                "has_next_page" => @messages.current_page >= @messages.total_pages ? 0 : 1,
                "content" => arr_messages.as_json
            }
        end
        
        # api for creating message information
        def create
            # render json information
            if message.save
                message_group = MessageGroup
                    .find_by_message_code(message.message_code)
                message_group.update({
                    "last_chat_id" => message.id
                })
                
                # prepare json
                arr_message = {
                    "user": {
                        "id": message.user_id
                    },
                    "message": {
                        "id": message.id,
                        "content": message.content,
                        "user_id": message.user_id,
                        "created_at": message.created_at,
                    }
                }
                
                render json: {
                    "status" => "ok",
                    "content" => arr_message.as_json
                }
            else
                render json: {
                    "status" => "ng"
                }
            end
        end
        
        # PATCH/PUT /message/1
        def update
            if message.update(message_params)
                render json: {
                    "status" => "ok",
                    "content" => MessagesSerializer.new(message).as_json
                }
            else
                render json: {
                    "status" => "ng"
                }
            end
        end
        
        # Only allow a trusted parameter "white list" through.
        private
            def message_params
                params.require(:messages).permit(:message_code, :user_id, :content, :status)
            end
    end
end