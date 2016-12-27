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


    Text {
        //anchors.horizontalCenter:parent.horizontalCenter
            text:""
            font.pixelSize: parent.height * 0.8
    }

}
