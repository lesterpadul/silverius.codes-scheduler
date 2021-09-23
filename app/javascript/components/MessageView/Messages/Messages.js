// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";
import Message from "./Message";
import MessageInput from "./MessageInput";
import MessageHeader from "./MessageHeader";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function Messages(){
    // - style for container
    var divContainer = {
        height: "100%",
        borderLeft: "1px solid #ccc"
    }
    
    // - return rendered view
    return (
        <div 
            className="col-8 pl-0"
            style={divContainer}>
            <MessageHeader />
            
            <hr className="m-0" />
            <Message />

            <hr className="m-0" />
            <MessageInput />
        </div>
    )
};

// - export
export default Messages;