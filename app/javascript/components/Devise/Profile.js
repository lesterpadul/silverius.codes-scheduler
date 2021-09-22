import React, {useState, useEffect, Fragment} from "react";
import { useParams } from "react-router";
import axios from "axios";
const Profile = function(){
    // - declare variables
    const [imageUrl, setImageUrl] = useState("")
    const [loaded, setLoaded] = useState(false)
    const [imgProgress, setImgProgress] = useState(0)

    const config = {
        onUploadProgress: function(progressEvent){
            setImgProgress((progressEvent.loaded / progressEvent.total) * 100)
        }
    }
    
    // - catch when the progress is updated
    useEffect(function(){
        console.warn()

    }, [imgProgress]);

    // - if loaded
    if (!loaded) {
        setImageUrl(reactInit.imageUrl)
        setLoaded(true)
    }

    // - style for div image
    let divImg = {
        position: 'absolute',
        zIndex: 1,
        height: '100%',
        width: '100%',
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        backgroundImage: "url(" + imageUrl + ")"
    }
    let divParent = {
        position: 'relative',
        height: '100%',
        width: '100%'
    }
    
    // - style for button
    let buttonUpload = {
        position: "absolute",
        top: "10px",
        left: "10px",
        zIndex: "3"
    }

    // - style for the progressbar
    let divProgress = {
        position: "absolute",
        zIndex: 2,
        height: "20px",
        width: "80%",
        left: "10%",
        top: "40%"
    }
    let divProgressInner = {
        width: imgProgress + "%"
    }

    // - change image for profile photo
    function changeImage () {
        // - get image file
        let imgFile = $('#img_user_url')[0].files[0];
        let imgReader = new FileReader()
        imgReader.readAsDataURL(imgFile)

        // - get form data
        const formData = new FormData();
        formData.append("users[image_url]", imgFile);
        
        // - catch when image is loaded
        imgReader.onload = function(e){
            // - set image background
            setLoaded(false)
            setImageUrl(e.target.result)
        }

        // - upload image
        axios
            .put("http://localhost:3000/api/users/1", formData, config)
            .then(function(res){
                console.warn(res)
            })
            .catch(function(err){
                console.warn(err)
            });
    }
    
    // - trigger file change
    function triggerFile () {
        setImgProgress(0)
        $('#img_user_url').val('')
        $('#img_user_url').click();
    }
    
    // - return template
    return (
        <div style={divParent}>
            <div style={divImg} id="img_content_display"></div>
            <button 
                onClick={triggerFile}
                style={buttonUpload}
                className="btn btn-primary rounded-0">
                <i className="fas fa-camera"></i> &nbsp;Upload Photo
            </button>
            <input
                onChange={changeImage}
                type="file"
                className="d-none"
                id="img_user_url"/>
                {
                    imgProgress > 0 &&
                    imgProgress < 100 &&
                    <div
                        style={divProgress}
                        className="progress">
                        <div 
                            style={divProgressInner}
                            className="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                    </div>
                }
        </div>
    );
};
export default Profile;