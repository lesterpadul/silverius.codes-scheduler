class ApiBaseController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :set_global_will_paginate

    def set_global_will_paginate
        WillPaginate.per_page = 5
    end
end