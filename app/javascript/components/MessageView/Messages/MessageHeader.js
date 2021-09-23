// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function MessageHeader(){
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

    // - return rendered view
    return (
        <div 
            className="d-flex mt-1 mb-1 p-3" 
            style={divContainer}>
            <div className="mr-2 align-self-center">
                <div 
                    className="bg-success" 
                    style={divImage}></div>
            </div>
            <div className="align-self-center">
                <span 
                    className="fw-bold" 
                    style={spanTitle}>Messages</span>
            </div>
        </div>
    )
};

// - export
export default MessageHeader;