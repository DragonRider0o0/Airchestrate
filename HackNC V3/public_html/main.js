/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
setTimeout(function() {
    console.log('yeya');
    document.getElementById("placeCircle").innerHTML="<img id='twinCircle' src='circle_light_green.svg' />";
}, 30);

/*
window.addEventListener("mousedown", alertInfo);

function alertInfo() {
    var x = event.clientX;
    var y = event.clientY;
    console.log('('+x+','+y+')');
}
*/

var play = true;
var normalSpeed = true;
var audio = document.getElementById("America");
var volume = 0.5;

   // window.addEventListener('load', eventWindowLoaded, false);
//    document.getElementById("pause").addEventListener("click",paused);
//    document.getElementById("speed").addEventListener("click",faster);

function paused(){
    if (play){
    audio.pause(); 
   // play = false;
   //         } else{
   //     audio.play();
   //     play = true;
    }
     document.getElementById("circle").style.animationPlayState= "paused";
     document.getElementById("circle").style.WebkitAnimationPlayState= "paused";
}


function faster(){
    if (normalSpeed){
        audio.playbackRate = 3.0;
        normalSpeed = false;
        
    }
}
                    
function volumeUp(){
    if (volume < 1){
        audio.volume += 0.1;
        console.log("up");
    }
}

function volumeDown(){
    if (volume > 0){
        audio.volume -= 0.1;
        console.log("down");
    } 
}

addEvent(document, "keydown", function (e) {
    e = e || window.event;
   // console.log('e.keyCode');
    switch (e.keyCode){
        case (38):
            volumeUp();
            break;
        case (40):
            volumeDown();
            break;
        case (32):
            start();
            break;
        case (80):
            paused();
            break;
        default:
            break;
    }
    // use e.keyCode
});

function addEvent(element, eventName, callback) {
    if (element.addEventListener) {
        element.addEventListener(eventName, callback, false);
    } else if (element.attachEvent) {
        element.attachEvent("on" + eventName, callback);
    } else {
        element["on" + eventName] = callback;
    }
}


function start() {
    // console.log('start');
    audio.play();
    audio.volume = volume;
    document.getElementById("circle").style.animationPlayState= "running";
    document.getElementById("circle").style.WebkitAnimationPlayState= "running";
}

/*
if (audio.pause() === true) {
    console.log('paused');
    document.getElementById("circle").style.animationPlayState = "paused";
    document.getElementById("circle").style.WebkitAnimationPlayState = "paused";
} else {
    console.log('playing');
    document.getElementById("circle").style.animationPlayState = "running";
    document.getElementById("cirlce").style.WebkitAnimationPlayState = "running";
}
*/
