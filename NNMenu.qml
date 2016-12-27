import QtQuick 2.0
import "main.js" as Scripts

Item {

    id:window_container

    states: [

       State {
            name:"Show"

            PropertyChanges {
                target:window_container
                //height:parent.height * 0.5
                y:parent.height * 0.1
                opacity:1

            }
        },

        State {
             name:"Hide"

             PropertyChanges {
                 target:window_container
                 //height:parent.height * 0.08
                 y:parent.height * 1.2
                 opacity:1
         }
        }

    ]



    transitions: [

        Transition {
            from: "Hide"
            to: "Show"

            NumberAnimation {
                target: window_container
                property: "y"
                duration: 500
                easing.type: Easing.InOutQuad
            }
        },


        Transition {
            from: "Show"
            to: "Hide"

            NumberAnimation {
                target: window_container
                property: "y"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    ]

state:"Hide"

       /* Rectangle {
            anchors.fill:parent
            color:"white"
            border.color:"black"
            radius: 8
        } */

        Image {
            source:"graphics/menu_pan.svg"
            anchors.centerIn: parent
            width:parent.width * 1.2
            height:parent.height * 1.2
            //fillMode:Image.PreserveAspectFit

        }


        Column {
            anchors.top:parent.top
            anchors.topMargin:parent.height * 0.12
            spacing:parent.height * 0.02
            width:parent.width

            /*Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Main Menu"
                font.pixelSize: window_container.height * 0.1

            } */

            Rectangle {
                width:parent.width * 0.9
                height:window_container.width * 0.001
                color:"gray"
                anchors.horizontalCenter: parent.horizontalCenter


            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width:parent.width * 0.8
                height:window_container.width * 0.08
                color:"gray"
                radius:8

                Text {
                    anchors.centerIn: parent
                    text:"Play"
                    font.pixelSize: parent.height * 0.4
                    color:"white"
                }

                MouseArea {
                    anchors.fill:parent
                    onClicked:{
                        answersleft = 0
                        lvl = 1
                        bb.visible = true

                        Scripts.playgame()
                    }
                }

            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width:parent.width * 0.8
                height:window_container.width * 0.08
                color:"gray"
                radius:8


                Text {
                    anchors.centerIn: parent
                    text:"<< "+gamemode+" >>"
                    font.pixelSize: parent.height * 0.4
                    color:"white"
                }

                MouseArea {
                    anchors.fill:parent
                    onClicked:switch(gamemode) {
                              case "Easy": gamemode = "Medium";break;
                              case "Medium": gamemode = "Hard";break;
                              case "Hard":gamemode = "Easy";break;
                              }
                }


            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width:parent.width * 0.8
                height:window_container.width * 0.08
                color:"gray"
                radius:8

                Text {
                    anchors.centerIn: parent
                    text:"Credits"
                    font.pixelSize: parent.height * 0.4
                    color:"white"
                }

                MouseArea {
                    anchors.fill:parent
                    onClicked:{
                        credits.visible = true
                    }
                }
            }
        }


        Rectangle {
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height * 0.01
            anchors.left:parent.left
            anchors.leftMargin:parent.height * 0.07

            //anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.4
            height:window_container.width * 0.08
            color:"gray"
            radius:8

            Text {
                anchors.centerIn: parent
                text:"Exit"
                color:"white"
                font.pixelSize: parent.height * 0.4
            }
            MouseArea {
                anchors.fill:parent
                onClicked:Qt.quit()
            }
        }
}

