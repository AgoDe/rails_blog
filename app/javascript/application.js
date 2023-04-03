// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import {Turbo} from "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

import "./channels"

const messagesBox = document.getElementById('messages-box');
const messageForm = document.getElementById('message-form');


// let scroll_bottom = function(scrool){ 
//     console.log(messagesBox.scrollHeight)
//     messagesBox.scrollTo(0 , messagesBox.scrollHeight);
// }

// document.addEventListener('turbo:load', function() {

//     console.log(messagesBox.scrollHeight)
// })
// document.addEventListener('turbo:submit-end', function(e) {

    
//     const scrool = e.detail.formSubmission.formElement.scrollHeight;
//     console.log(e.detail.formSubmission)
//     messageForm.reset();
//     scroll_bottom(scrool);
// })


