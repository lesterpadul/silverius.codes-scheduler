// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";
import Message from "./Message";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function MessageList(params){
    let divContainer = {
        height: "86.4%",
        overflowY: "auto"
    }

    // - warn
    console.warn("[message_list] updating view -> " + JSON.stringify(params))
    
    // - declare empty
    var partialMessage = "";
    
    // - loop through users
    if (
        typeof params.arrMessages !== "undefined" &&
        params.arrMessages.length > 0
    ) {
        var partialMessage = params.arrMessages.map(function(item, index){
            return (
                <Message
                    key={item.message.id}
                    message={item}/>
            )
        });
    }
    
    // - return rendered view
    return (
        <div 
            className="p-3" 
            style={divContainer}>
            {
                params.message.has_next_page &&
                <button
                    onClick={params.listMessages(true)}
                    className="btn btn-primary btn-block rounded-0">
                    Load More!
                </button>
            }
            {partialMessage}
        </div>
    )
};

// - export
export default MessageList;