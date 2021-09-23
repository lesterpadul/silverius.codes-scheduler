// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";
import UserHeader from "./UserHeader";
import UserList from "./UserList";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function Users(params){
    const [arrUsers, setArrUsers] = useState([])
    const [loaded, setLoaded] = useState(false)

    // - function that changes the current message code
    function listUsers(){
        // - if loaded, stop.
        if (loaded) {
            return false;
        }
        
        // - stop spamming
        setLoaded(true);

        // - search term
        let searchTerm = $("#input-text-search").length != 0 ? $("#input-text-search").val() : ""
        
        // - else get information
        axios
        .get(
            '/api/message_groups?search_term=' + searchTerm + '&session_id=' + window.reactGlobal.user_id
        )
        .then(function(resp){
            setArrUsers(resp.data.content);
            
        })
        .catch(function(resp){
            setLoaded(false);

        })
    }
    
    // - list users
    listUsers()

    // - return rendered view
    return (
        <div className="col-4 mr-0 pr-0">
            <UserHeader 
                listUsers={listUsers} />
            <hr className="mb-0" />
            <UserList 
                changeMessageCode={params.changeMessageCode}
                arrUsers={arrUsers} />
        </div>
    )
};

// - export
export default Users;