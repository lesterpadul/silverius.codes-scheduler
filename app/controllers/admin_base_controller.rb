class AdminBaseController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_global_will_paginate
    layout "application"
    @view_name = ""

    def set_global_will_paginate
        WillPaginate.per_page = 5
        @view_name = params[:controller]
    end
end