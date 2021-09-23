// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, Fragment } from "react";

// - this is the component for ajax calls
import axios from "axios";

// - airline function
function UserHeader(params){
    // - declare variables
    let currentUserName = window.reactGlobal.user_name
    let currentUserImg = window.reactGlobal.user_image
    
    // - styles
    let divContainer = {
        height: "90px"
    }
    let divImg = {
        height: "30px",
        width: "30px",
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        backgroundImage: "url(" + currentUserImg + ")"
    }
    let spanTitle = {
        fontWeight: "bold"
    }

    // - return rendered view
    return (
        <div 
            className="d-flex flex-column mt-1 mb-1 p-3" 
            style={divContainer}>
            <div 
                className="d-flex justify-content-between">
                <div 
                    className="mr-2 align-self-start">
                    <div 
                        className="bg-success" 
                        style={divImg}></div>
                </div>
                <div className="align-self-center">
                    <span 
                        className="fw-bold" 
                        style={spanTitle}>{currentUserName}</span>
                </div>
            </div>
            <div
                className="mt-3">
                <div 
                    className="input-group">
                    <input 
                        type="text" 
                        className="form-control bg-light small" 
                        id="input-text-search"
                        placeholder="Search for..." 
                        aria-label="Search" 
                        aria-describedby="basic-addon2" />
                    <div className="input-group-append">
                        <button 
                            type="button"
                            onClick={params.listUsers}
                            className="btn btn-primary">
                            <i className="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    )
};

// - export
export default UserHeader;