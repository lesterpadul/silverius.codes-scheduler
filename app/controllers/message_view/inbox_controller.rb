module MessageView
    class InboxController < AdminBaseController
        before_action :set_common_view_name

        def index
        end

        def profile
            @id = params[:id]
        end

        private
            # set common view name
            def set_common_view_name
                @view_name = "message_view"
                @params = params
            end
    end
end