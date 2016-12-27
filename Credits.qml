import QtQuick 2.0

Item {

    Image {
        width:parent.width
        height:parent.height
        source:"graphics/cookie.png"
        clip:true


        Column {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.contentWidth * 0.8
            height:parent.contentHeight * 0.9
            spacing:parent.height * 0.02

            Text {
                text:"Credits"
                color:"white"
                font.pointSize:32
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                width:parent.width
                height:parent.height * 0.01
                color:"white"
            }

            Text {
                width:parent.width
                wrapMode:Text.WordWrap
                color:"white"
                font.pointSize: 16
                text:"Num-Nom was created as a part of Vague Entertainments 'App a Week' series.These programs are released free of charge for all to use. If you like the program consider donating to Vague Entertainment on Patreon.com. Search for Vague Entertainment the program to find us"
            }


            Text {
                color:"white"

                font.pointSize: 16
                text:"Coding/Design/Sound: Benjamin Flanagin"
            }

            Text {
                color:"white"

                font.pointSize: 16
                text:"Creature Design: Liam Flanagin (7)"
            }

            Text {
                color:"white"

                font.pointSize: 16
                text:"Beta Testing: Seamus Flanagin (5)"
            }

            Text {
                color:"white"
                font.pointSize: 16
                text:"Dedicated to my sons for their love of math and monsters"
            }

        }

        }

        Text {
            anchors.bottom: parent.bottom
            anchors.bottomMargin:parent.height * 0.14
            anchors.horizontalCenter: parent.horizontalCenter
            text:"(tap to close)"
            color:"white"
        }
MouseArea {
    anchors.fill: parent
    onClicked:parent.visible = false
    enabled: if(parent.visible == true) {true} else {false}
}

}

