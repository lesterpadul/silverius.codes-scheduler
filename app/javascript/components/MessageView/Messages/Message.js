// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function Message(params){
    // - return rendered view
    return (
        <Fragment>
            {
                params.message.user.id != window.reactGlobal.user_id &&
                <div className="d-flex flex-row  mt-2 mb-2">
                    <div className="d-flex flex-column pl-1">
                        <small>{params.message.message.created_at}</small>
                        <div className="bg-secondary text-white p-2 rounded">{params.message.message.content}</div>
                    </div>
                </div>
            }

            {
                params.message.user.id == window.reactGlobal.user_id &&
                <div className="d-flex flex-row-reverse mt-2 mb-2">
                    <div className="d-flex flex-column pr-1">
                        <small>{params.message.message.created_at}</small>
                        <div className="bg-primary text-white p-2 rounded">{params.message.message.content}</div>
                    </div>
                </div>
            }
        </Fragment>
    )
};

// - export
export default Message;