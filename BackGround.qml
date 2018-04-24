import QtQuick 2.8


Item {
    anchors.fill:parent

    property double rock: 3


    Timer {
        id:dance
        interval: 1800
        repeat:true
        running:true
        onTriggered:if(rock == 3) {rock = -3} else {rock = 3}
    }

    Image {
        id:picture
        anchors.fill: parent
        source:"graphics/Title.png"
        fillMode: Image.PreserveAspectFit
        rotation:rock


    }



}

