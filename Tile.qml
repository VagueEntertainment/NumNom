import QtQuick 2.8
import QtMultimedia 5.9

import "main.js" as Scripts

Item {

    //width:parent.height * 0.1
    //height:parent.height * 0.1

    property int number: 0
    property int row: 0
    property int column: 0
    property int num:0
    property bool correct:false
    property bool  targeted: false
    property int ememy: 1
    property int countdown:10
    property int tdestroyed: 0
    //clip:true

    Timer {
        id:destroy
        interval:100
        running:if(targeted == true) {true} else {false}
        repeat:true
        onTriggered: if (correct == false ) { if(targeted == true && countdown == 0)
                            {thenumber = number,tileselected = num,attack =0,tdestroyed = 1,flash.state = "End"}
                     else {if(countdown > 0) {countdown = countdown -1,attack =1
                                                if(countdown == 1) {attackeffect.play(),flash.visible = true}} }
                     } else {targeted == false}
    }

    Rectangle {
        id:icying
        anchors.centerIn: parent
        width:parent.width * 0.85
        height:parent.height * 0.85
        color:switch(Math.floor((Math.random() * 5) + 1)) {
              case 1: "red";break;
              case 2: "turquoise";break;
              case 3: "orange";break;
              case 4: "purple";break;
              case 5: "limegreen";break;
              }
        radius: width / 2
        visible:if(correct == false) {true} else {false}

        border.color:"black"
    }

    Image {
        anchors.fill:parent
        source:if(tdestroyed == 0) {if(correct == false){"graphics/Cookie.svg"}
                   else {"graphics/Cookie-Gone.svg"} } else {
                   if(theenemy == 0) {
                   "graphics/enemy/destroyed1.svg"} else if(theenemy == 1) {
                        "graphics/enemy/Cookie-eaten1.svg"
                   }
               }

        mirror:if(Math.floor((Math.random() * 10) + 1) % 2) {true} else {false}
    }

    Text {
        anchors.centerIn: parent
        text:if(correct == false) {number} else {""}
        font.pixelSize: parent.height * 0.4 - text.length
        onTextChanged:if(text == "") {icying.visible = false} else {icying.visible = true}
        visible:if(tdestroyed == 1) {false} else {true}
    }

    Image {
        anchors.fill: parent
        source:"graphics/enemy/t1.svg"
        visible:if(targeted == true) {true} else {false}
    }

    Rectangle {
        id: flash
        anchors.centerIn: parent
        visible:false
        states: [
            State {
                name:"Begin"
                PropertyChanges {
                    target:flash
                    width:parent.width
                    height:parent.height
                    radius: width /2
                }
                //when:flash.visible = false

            },
            State {
                name:"End"
                 PropertyChanges {
                     target:flash
                     width:0
                     height:0
                     radius: width /2

                 }
                 //when: flash.visible = True
            }

        ]

        transitions: [

            Transition {
                from: "Begin"
                to: "End"

                NumberAnimation {
                    target: flash
                    property: "height"
                    duration: 400
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: flash
                    property: "width"
                    duration: 400
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: flash
                    property: "radius"
                    duration: 400
                    easing.type: Easing.InOutQuad
                }
            }
]

        state:"Begin"
    }


    MouseArea {
        anchors.fill:parent
        //onClicked: console.log(number);
       onClicked: thenumber = number,tileselected = num,player.state = "Show",moved = 1;
    }

    Audio {
            id:attackeffect
            source:if(theenemy == 0) {"sounds/enemy/attack1.wav"} else if (theenemy == 1) {}
            volume: 0.5
    }

}


