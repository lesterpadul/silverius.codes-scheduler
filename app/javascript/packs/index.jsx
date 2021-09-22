// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.
import React, {useState, useEffect, Fragment} from 'react'
import { useParams } from "react-router";
import ReactDOM from 'react-dom'
import Profile from '../components/Devise/Profile';
document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Profile />,
    document.getElementById('container_photo_upload')
  )
})
