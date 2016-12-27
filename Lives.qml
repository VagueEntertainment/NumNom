import QtQuick 2.0

Item {
    id:window_container

    width:livesleft.width + title.width
    //clip:true

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
                duration: 200
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

    Image {
        id:border
        source:if(cookies >= answersleft / 1.4 && cookies > taken) {"graphics/player/1-2.png"}
                        else if (cookies >= answersleft / 4 && cookies > taken) {"graphics/player/1-3.png"}
                        else if (cookies >= answersleft / 8 && cookies > taken) {"graphics/player/1-1.png"}
                            else {"graphics/player/1-0.png"}
        anchors.fill:parent
        fillMode:Image.PreserveAspectFit

        Column {
            id:cookiescollected
            anchors.horizontalCenter:parent.horizontalCenter
            anchors.bottom:parent.bottom
            anchors.bottomMargin: parent.height * 0.32
            width:parent.width * 0.30

            Repeater {
                model: cookies
                Image {
                    x:Math.floor((Math.random() * 10) + 1);
                    width: cookiescollected.width * 0.70
                    height: border.height * 0.02
                    source:"graphics/player/cookie.png"


                }
            }

        }

    }

    Row {
        id:livesleft
        anchors.horizontalCenter:border.horizontalCenter
        anchors.bottom: border.bottom
        anchors.bottomMargin:border.height * 0.01

        spacing: parent.height * 0.01
        Repeater {
            model: lives
            Image {
                width: height
                height: border.height * 0.2
                source:"graphics/live.png"

            }
        }
    }


}

