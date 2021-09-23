// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function User(params){
    // - style container
    let divContainer = {
        height: "80px"
    }
    let divImg = {
        width: "50px",
        height: "50px",
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        backgroundImage: "url(" + params.userInfo.user.image_url + ")"
    }
    let divMessage = {
        fontWeight: "bold"
    }
    let divMessageFont = {
        fontSize: "12px"
    }
    let divSmall = {
        fontWeight: "bold"
    }
    
    // - return rendered view
    return (
        <Fragment>
            <div
                onClick={() => params.changeMessageCode(params.userInfo.message_group.message_code, params.userInfo) }
                className={`d-flex mt-1 mb-1 p-1 ${params.messageCode == params.userInfo.message_group.message_code ? "bg-primary rounded text-white" : "" }`}
                style={divContainer}>
                <div className="flex-shrink-0 mr-2">
                    <div className="bg-success m-1" style={divImg}></div>
                </div>
                <div className="flex-grow-1">
                    <span className="fw-bold" style={divMessage}>{params.userInfo.user.name}</span>
                    <div style={divMessageFont}>
                        {params.userInfo.message.content}
                        <small
                            className="ml-2" 
                            style={divSmall}>{params.userInfo.message.update_at}</small>
                    </div>
                </div>
            </div>
        </Fragment>
    )
};

// - export
export default User;