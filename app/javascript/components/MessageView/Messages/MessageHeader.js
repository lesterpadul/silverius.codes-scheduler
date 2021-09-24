// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function MessageHeader(params){
    // - style containers
    let divContainer = {
        height: "50px"
    }
    let divImage = {
        height: "30px",
        width: "30px"
    }
    let spanTitle = {
        fontWeight: "bold"
    }
    let userLink = "/message_view/profile/" + params.currentUser.user.id 
    
    // - return rendered view
    return (
        <div 
            className="d-flex mt-1 mb-1 p-3" 
            style={divContainer}>
            <div className="align-self-center">
                <span 
                    className="fw-bold" 
                    style={spanTitle}>
                    <a href={userLink}>
                        {params.currentUser.user.name}
                    </a>
                </span>
            </div>
        </div>
    )
};

// - export
export default MessageHeader;