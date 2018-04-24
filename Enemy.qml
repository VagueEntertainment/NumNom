import QtQuick 2.8
import QtMultimedia 5.9


    Item {
        id:window_container

        width:livesleft.width + title.width
        clip:true

        property string currentenemy:"mechaheart"

        states: [

           State {
                name:"Show"

                PropertyChanges {
                    target:window_container
                    x:parent.x
                    opacity:1

                }
            },

            State {
                 name:"Hide"

                 PropertyChanges {
                     target:window_container
                    x:width - parent.x
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
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    target: window_container
                    property: "x"
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
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        ]


        state:"Hide"

        onStateChanged: if(window_container.state == "Show") {//playIntro.play()
                        if (currentenemy == "mechaheart") {theenemy = 0} else {theenemy = 1}
                        }

        Image {
            id:border
            source:if(attack == 1) {"graphics/enemy/"+currentenemy+"-a.png"} else if(cookies >= answersleft / 1.4 && cookies > taken) {"graphics/enemy/"+currentenemy+"-3.png"}
                            else if (cookies >= answersleft / 4 && cookies > taken) {"graphics/enemy/"+currentenemy+"-2.png"
                                                                                        if(parent.state == "Show") {/*distress.play()*/}}
                            else if (cookies >= answersleft / 8 && cookies > taken) {"graphics/enemy/"+currentenemy+"-1.png"
                                                                                        if(parent.state == "Show") {/*distress.play()*/}}
                                else {"graphics/enemy/"+currentenemy+"-1.png"}
            anchors.fill:parent
            fillMode:Image.PreserveAspectFit


        }

        Audio {
               id: playIntro
               source:if(theenemy == 0) {"sounds/enemy/intro1.wav"} else {}
               autoLoad: true
    }

        Audio {
            id:distress
            source:if (cookies >= answersleft / 4 && cookies > taken) {if(theenemy == 0) {"sounds/enemy/distress1.wav"} else {} }
                        else if (cookies >= answersleft / 8 && cookies > taken) {if(theenemy == 0) {"sounds/enemy/distress2.wav"} else {}}
                            else {if(theenemy == 0) {"sounds/enemy/blank.wav"} else {}}
            autoLoad: true

        }

    }




