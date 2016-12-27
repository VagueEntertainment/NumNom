import QtQuick 2.0

Item {

    property string name:""

    id:window_container




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


    state:"Show"

Rectangle {
 //anchors.centerIn: title
 width:parent.width * 0.80
 height:gamefield.height * 0.6
 border.color:"tan"
 border.width:parent.height * 0.3
 color:"seagreen"
 clip:true

FontLoader { id: chalkboard; source: "fonts/EraserRegular.ttf" }

    Text {
         id:title
            anchors.top:parent.top
            anchors.topMargin:parent.height * 0.05
            anchors.horizontalCenter:parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: name
            font.pixelSize: parent.width * 0.15
            width:parent.width * 0.90
            wrapMode:Text.WordWrap
            font.family: chalkboard.name
            color:"white"

    }

    Column {
        width:parent.width * 0.90
        anchors.top: title.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter:parent.horizontalCenter
        spacing:parent.height * 0.05

        Text {
            color:"white"
            text:"Num-Nom  "+ cookies
            font.pixelSize: parent.width * 0.08
            font.family: chalkboard.name
            width:parent.width / 2
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            color:"white"
            text:"Bad Guy  "+ taken
            font.pixelSize: parent.width * 0.08
            font.family: chalkboard.name
            width:parent.width / 2
            horizontalAlignment: Text.AlignLeft
        }

    }

}

}

