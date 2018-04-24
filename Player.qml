import QtQuick 2.8

Item {

    id:window_container

    property int timeout: 0
    property int loR: 0

   Timer {
        id:idle
        interval: 400
        repeat:false
        running:false
        onTriggered://if(movex.animation.running == false && movey.animation.running == false) {
                        player.state = "Hide", player.x = gridwidth / 2,player.y = background.height

                   // }

    }


    states: [

       State {
            name:"Show"

            PropertyChanges {
                target:window_container

                opacity:1

            }
        },

        State {
             name:"Hide"

             PropertyChanges {
                 target:window_container

                 opacity:0
         }
        }


    ]



    transitions: [

        Transition {
            from: "Hide"
            to: "Show"

            NumberAnimation {
                target: window_container
                property: "opacity"
                duration: 100
                easing.type: Easing.InOutQuad
            }
        },


        Transition {
            from: "Show"
            to: "Hide"

            NumberAnimation {
                target: window_container
                property: "opacity"
                duration: 100
                easing.type: Easing.InOutQuad
            }


        }
    ]

state:"Hide"

    onStateChanged: if(window_container.state == "Show") {idle.running = true} else {idle.running = false}


    Behavior on x {
            id:movex

        PropertyAnimation { properties: "x";
                            easing.type: Easing.InSine
                            easing.amplitude: 1.0;
                            easing.period: 1.5

                            duration:100

                    }

       }
    Behavior on y {

        id:movey
           //NumberAnimation { duration: 1000 }

        PropertyAnimation { properties: "y";
                            easing.type: Easing.InSine
                            easing.amplitude: 1.0;
                            easing.period: 1.5
                            duration:100
                }
    }

    Image {
        id:avatar


        source: "graphics/hand.png"
        anchors.fill:parent
        mirror:if(loR == 0) {true} else {false}
        fillMode: Image.PreserveAspectFit

        //Text {text:animu}
    }

}

