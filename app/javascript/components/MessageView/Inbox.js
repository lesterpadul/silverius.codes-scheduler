// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";
import Users from "./Users/Users";
import Messages from "./Messages/Messages";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function Inbox(){
    // - declare variables
    const [messageCode, setMessageCode] = useState("")
    const [currentUser, setCurrentUser] = useState({})
    
    // - div containers
    let divCardBody = {
        padding: "0px"
    }
    let divRow = {
        height: "45rem"
    }

    // - this function will get all the airlines
    useEffect(()=>{
        console.warn("change message code -> " + messageCode)

    }, [messageCode])

    // - function that changes the current message code
    function changeMessageCode(newMessageCode, currentUser){
        // - check if message code is not set
        if (typeof newMessageCode == "undefined") {
            return false;
        }

        // - if new message is same as old, do nothing
        if (newMessageCode == messageCode) {
            return false;
        }

        // - set message code
        setMessageCode(newMessageCode);
        setCurrentUser(currentUser);
        console.warn("changed message code " + messageCode);
    }
    
    // - return rendered view
    return (
        <div>
            <div 
                className="card mb-4 rounded-0">
                <div 
                    className="card-body" 
                    style={divCardBody}>
                    <div 
                        className="row" 
                        style={divRow}>
                        <Users
                            changeMessageCode={changeMessageCode} />
                        <Messages 
                            messageCode={messageCode} />
                    </div>
                </div>
            </div>
        </div>
    )
};

// - export
export default Inbox;