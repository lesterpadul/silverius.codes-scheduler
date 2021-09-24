// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - airline function
function MessageEmpty(params){
    // - style for container
    var divContainer = {
        height: "100%",
        borderLeft: "1px solid #ccc"
    }

    // - return rendered view
    return (
        <div 
            className="col-8 pl-0 d-flex align-items-center justify-content-center"
            style={divContainer}>
            <div className="d-flex flex-column">
                <h1 className="d-flex align-items-center justify-content-center">
                    <i className="fas fa-comments fa-8x"></i>
                </h1>
                <div>
                    <center>
                        Start a conversation with someone!
                    </center>
                </div>
            </div>
        </div>
    )
};

// - export
export default MessageEmpty;