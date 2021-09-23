// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function Message(){
    let divContainer = {
        height: "86.4%",
        overflowY: "auto"
    }
    let divMessageItem = {
        width: "20px",
        height: '20px'
    }

    // - return rendered view
    return (
        <div 
            className="p-3" 
            style={divContainer}>
            
            <div className="d-flex flex-row  mt-2 mb-2">
                <div className="d-flex align-items-end">
                    <div 
                        className="bg-success" 
                        style={divMessageItem}></div>
                </div>
                <div className="d-flex flex-column pl-1">
                    <div>
                        <small>3h ago</small>
                    </div>
                    <div className="bg-secondary text-white p-2 rounded">
                        This is some content from a media component.
                    </div>
                </div>
            </div>

            <div className="d-flex flex-row-reverse mt-2 mb-2">
                <div className="d-flex align-items-end">
                    <div 
                        className="bg-success" 
                        style={divMessageItem}></div>
                </div>
                <div className="d-flex flex-column pr-1">
                    <small>3h ago</small>
                    <div className="bg-primary text-white p-2 rounded">
                        This is some content from a media component.
                    </div>
                </div>
            </div>
            
        </div>
    )
};

// - export
export default Message;