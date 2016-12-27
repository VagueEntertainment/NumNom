import QtQuick 2.0
import "main.js" as Scripts

Item {

    //property string number: "0"
    property int row: 0
    property int column: 0
    property int num:0





    MouseArea {
        anchors.fill:parent
       propagateComposedEvents: true
       hoverEnabled: true
        onEntered:if(player.state != "Show") {newlocation = num,Scripts.charactermove(parent.x,parent.y,parent.width,parent.height) }

    }
}

