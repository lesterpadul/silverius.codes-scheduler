// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function MessageInput(params){
    // - return rendered view
    return (
        <div className="p-0">
            <div className="input-group">
                <input 
                    type="text" 
                    className="form-control bg-light border-0 small rounded-0" 
                    id="input-message-new"
                    placeholder="Search for..." 
                    aria-label="Search" 
                    aria-describedby="basic-addon2" />
                <div className="input-group-append">
                    <button 
                        onClick={params.createMessage}
                        className="btn btn-primary rounded-0" 
                        type="button">
                        <i className="fas fa-paper-plane fa-sm"></i>
                    </button>
                </div>
            </div>
        </div>
    )
};

// - export
export default MessageInput;