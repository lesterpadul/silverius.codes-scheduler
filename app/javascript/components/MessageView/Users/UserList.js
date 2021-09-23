// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";
import User from "./User";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function UserList(params){
    // - style for div
    let divContainer = {
        height: "35.7rem",
        overflowY: "auto"
    }
    
    // - loop through users
    var partialUser = params.arrUsers.map(function(item, index){
        return (
            <User
                key={item.user.id}
                messageCode={params.messageCode}
                changeMessageCode={params.changeMessageCode}
                userInfo={item}/>
        )
    });

    // - return rendered view
    return (
        <Fragment>
            <div className="p-3" style={divContainer}>
                {partialUser}
            </div>
        </Fragment>
    )
};

// - export
export default UserList;