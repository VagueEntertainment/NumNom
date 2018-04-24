import QtQuick 2.8

import "main.js" as Scripts

Item {

    property string message:""
    property double award: 0.0

    Rectangle {
        width:parent.width
        height:parent.height

        color:Qt.rgba(0.1,0.1,0.1,1)
    }
    //replace with graphics

    onVisibleChanged: if(parent.visible == true ) {player.state = "Hide",enemy.state = "Hide",livecounter.state = "Hide",moved = 0,award = cookies / total * 100}

    Image {
        anchors.fill: parent
        source:if(winlose == 0) {"graphics/lose.png"} else if (winlose == 1) {if (lvl < 10) {"graphics/won.png"} else {"graphics/endset.png" } }
        fillMode:Image.PreserveAspectFit
    }

    Text {
        anchors.top:parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: (parent.height * 0.3) - text.length
        text:if(winlose == 0) {"You Lose"} else if (winlose == 1  ) {if (lvl < 10) {"You Win!!"} else { "Good JOB!!!"} }
        color:"white"
        style:Text.Outline
    }

    Row {
        visible: if(winlose == 1 && lvl < 10) {true} else {false}
        y:parent.height * 0.5
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.height * 0.60
        height:parent.height * 0.2

        Repeater {
            anchors.horizontalCenter: parent.horizontalCenter
            model:if(award >= 80) {3} else if (award >= 50){2} else {1}

            Image {

                width: parent.height
                height: parent.height
                source:"graphics/cookie.png"

            }
        }
    }


    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin:parent.height * 0.1
        font.pixelSize: parent.height * 0.06
        text:"(press to continue)"
        color:"white"
    }

    MouseArea {
        anchors.fill:parent
        onClicked:{
                    if(lvl % 10 == 0) { gamefield.state = "Hide",thecourse.state = "Hide",livecounter.state = "Hide",
                                   title.state = "Hide",
                                   tillfinished.state = "Hide",themenu.state = "Show"
                    } else {
                    parent.visible = false
             if(winlose == 0) {
            gamefield.state = "Hide",thecourse.state = "Hide",livecounter.state = "Hide", title.state = "Hide",
                  tillfinished.state = "Hide",themenu.state = "Show"
    } else if (winlose == 1) {
                 gamefield.state = "Hide",thecourse.state = "Hide",livecounter.state = "Hide", title.state = "Hide",
                       tillfinished.state = "Hide",lvl = lvl + 1 ,Scripts.playgame()}
            }
        }
    }
}

