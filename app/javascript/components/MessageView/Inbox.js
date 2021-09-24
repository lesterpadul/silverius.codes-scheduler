// - this is the react library, along with the scopes we want to use
// - think of this as $scope, $rootScope and etc in angularjs
import React, { useState, useEffect, useReducer } from "react";
import Users from "./Users/Users";
import MessageEmpty from "./Messages/MessageEmpty";
import MessageList from "./Messages/MessageList";
import MessageInput from "./Messages/MessageInput";
import MessageHeader from "./Messages/MessageHeader";

// - this is the component for ajax calls
import axios from "axios";
import Message from "./Messages/Message";

const initialMessage = {
    messages: [],
    current_page: 1,
    has_next_page: 1,
    is_loading: false,
    is_initialized: false,
    is_sending_message: false
};
const initialChat = {
    user: {},
    messageCode: ''
}

// - function for reducing message
function reducerMessage(state, action){
    console.warn("message ->")
    console.warn(action)
    return action
}

// - function for reducing chat
function reducerChat(state, action){
    console.warn("chat ->")
    console.warn(action)
    return action
}

// - airline function
function Inbox(){
    // - declare variables
    let [message, dispatchMessage] = useReducer(reducerMessage, initialMessage)
    let [chat, dispatchChat] = useReducer(reducerChat, initialChat)
    let [currentUpdate, dispatchCount] = useState(0)
    
    // - div containers
    let divCardBody = {
        padding: "0px"
    }
    let divRow = {
        height: "45rem"
    }
    let divContainer = {
        height: "100%",
        borderLeft: "1px solid #ccc"
    }
    
    // - function that changes the current message code
    function changeMessageCode(newMessageCode, currentUser){
        // - check if message code is not set
        if (typeof newMessageCode == "undefined") {
            return false;
        }

        // - if new message is same as old, do nothing
        if (newMessageCode == chat.messageCode) {
            return false;
        }

        // - dispatch once!
        dispatchChat({
            user: currentUser,
            messageCode: newMessageCode
        })
        
        // - new message infroamtion
        MessageController().listMessages(false)
    }
    
    // - controller for message
    function MessageController(){
        return {
            // - function that changes the current message code
            listMessages: function(loadMore){
                // - if loading list
                if (message.is_loading) {
                    return console.warn("still sending!; unable to proceed!")
                }

                // - if load more
                if (loadMore) {
                    message.current_page = message.current_page + 1
                }
                
                // - set message sending to true
                message.is_loading = true
                dispatchMessage(message)
                
                // - else get information
                axios
                    .get(
                        '/api/messages/' + chat.messageCode + '?page=' + message.current_page
                    )
                    .then(function(resp){
                        // - content
                        var tmpData = resp.data.content;
                        tmpData = tmpData.reverse()
                        
                        // - set message information
                        message.messages = tmpData
                        message.has_next_page = resp.data.has_next_page
                        
                        // - dispatch message information
                        dispatchMessage(message)

                    })
                    .catch(function(resp){})
                    .then(function(){
                        // - dispatch message
                        message.is_loading = false
                        dispatchMessage(message)

                    })
            },
            
            // - create messages
            createMessage: function(){
                // - if blank
                if ($.trim($('#input-message-new').val()).length == 0) {
                    return console.warn("input is empty; unable to proceed!")
                }

                // - if loading list
                if (message.is_sending_message) {
                    return console.warn("still sending!; unable to proceed!")
                }

                // - set message sending to true
                message.is_sending_message = true
                dispatchMessage(message)

                // - else get information
                axios
                    .post(
                        '/api/messages/',
                        {
                            "messages": {
                                "message_code": chat.messageCode,
                                "user_id": window.reactGlobal.user_id,
                                "content": $('#input-message-new').val()
                            },
                            "session_id": window.reactGlobal.user_id
                        }
                    )
                    .then(function(resp){
                        // - empty the chat box
                        $('#input-message-new').val('')

                        // - content
                        var tmpData = resp.data.content;
                        message.messages.push(tmpData)
                        message.is_sending_message = false

                        // - dispatch message information
                        setTimeout(function(){
                            dispatchMessage(message)
                            dispatchCount(currentUpdate++)
                        }, 2000);
                    })
                    .catch(function(resp){})
                    .then(function(){})
            }
        }
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
                            messageCode={chat.messageCode}
                            changeMessageCode={changeMessageCode} />
                        
                        {
                            chat.messageCode.length > 0 &&
                            <div 
                                className="col-8 pl-0"
                                style={divContainer}>
                                
                                <MessageHeader
                                    currentUser={chat.user} />
                                
                                <hr className="m-0" />
                                <MessageList
                                    listMessages={MessageController().listMessages}
                                    message={message}
                                    arrMessages={message.messages} />

                                <hr className="m-0" />
                                <MessageInput
                                    createMessage={MessageController().createMessage} />
                            </div>
                        }

                        {
                            chat.messageCode.length == 0 &&
                            <MessageEmpty />
                        }
                    </div>
                </div>
            </div>
        </div>
    )
};

// - export
export default Inbox;