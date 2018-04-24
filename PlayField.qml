import QtQuick 2.8
import QtQuick.Window 2.2

import "main.js" as Scripts

Item {
    id:thefield

    states: [

       State {
            name:"Show"

            PropertyChanges {
                target:thefield

                opacity:1

            }
        },

        State {
             name:"Hide"

             PropertyChanges {
                 target:thefield

                 opacity:0
         }
        }


    ]



    transitions: [

        Transition {
            from: "Hide"
            to: "Show"

            NumberAnimation {
                target: thefield
                property: "opacity"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        },


        Transition {
            from: "Show"
            to: "Hide"

            NumberAnimation {
                target: thefield
                property: "opacity"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    ]

state:"Hide"

    Timer {
        id:checktiles
        interval: 30
        running:if(thefield.visible == true) {true} else {false}
        repeat:true
        onTriggered: if(thenumber >= 0 && tileselected >=0) {Scripts.checkequation(thenumber,tileselected)}
    }

    Timer {
        id:targetted
        interval: 5000
        running:if(thefield.visible == true && lvl > 3  && moved == 1) {true} else {false}
        repeat:true
        onTriggered: attack =1,Scripts.attacking()
    }

    Timer {
        id:tosolve
        interval:10
        running:true
        repeat:false
        onTriggered: if(thefield.state == "Show") {Scripts.totalcorrect()}
    }


    onStateChanged:if(thefield.state == "Show") {Scripts.playgrid(gridwidth,gridheight)
                                                                            if(newgame == 1) {Scripts.fillmap()}
                                                                                        Scripts.totalcorrect()
                                                                                          newgame = 0}

    Image {
        id:bg
        anchors.centerIn: parent
        width:parent.width * 1.2
        height:parent.height * 1.2
        source:"graphics/pan.png"
    }





}

