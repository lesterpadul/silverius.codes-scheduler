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
    const [hasMore, setHasMore] = useState(false)
    const [currentPage, setCurrentPage] = useState(1)

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
            '/api/message_groups?search_term=' + searchTerm + '&session_id=' + window.reactGlobal.user_id + "&page=" + currentPage
        )
        .then(function(resp){
            console.warn("check respoonse")
            if (currentPage > 1) {
                let tmpData = resp.data.content;
                setArrUsers(arrUsers.concat(tmpData));

            } else {
                setArrUsers(resp.data.content);

            }
            
            // - set variables
            let checkNextPage = resp.data.has_next_page > 0;
            setHasMore(checkNextPage);
            setCurrentPage(checkNextPage ? currentPage + 1 : currentPage)
        })
        .catch(function(resp){
            setLoaded(false);

        })
    }

    // - reset list
    function resetList() {
        // - set current page
        setCurrentPage(1)
        setLoaded(false);

        // - clear cm code and user info
        params.changeMessageCode('', {})
    }
    
    // - list users
    listUsers()

    // - return rendered view
    return (
        <div className="col-4 mr-0 pr-0">
            <UserHeader 
                resetList={resetList} />
            <hr className="mb-0" />
            <UserList 
                messageCode={params.messageCode}
                changeMessageCode={params.changeMessageCode}
                arrUsers={arrUsers} />
            {hasMore}
            {
                hasMore &&
                <button
                    onClick={() => setLoaded(false) }
                    className="btn btn-primary btn-block rounded-0">
                    LOAD MORE</button>
            }
        </div>
    )
};

// - export
export default Users;