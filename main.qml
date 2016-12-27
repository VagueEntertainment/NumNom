import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtMultimedia 5.3

import "main.js" as Scripts

ApplicationWindow {

    visible: true

    width:Screen.width
    height:Screen.height

    property double gridheight: Screen.height
    property double gridwidth:Screen.width

    property int cmapcreated:0
    property int mapcreated: 0

    property int lives: 3

    property int tileselected: -1
    property int thenumber:-1

    property int answersleft:0

    property string equate: ""

    property string mathy: "Even Numbers"

    property int winlose:3

    property int newgame: 0
    property int lvl: 1

    property string gamemode:"Easy"


    //character stuff
    property int currentlocation: 0
    property int newlocation: 0

    property double characterx:0
    property double charactery:0
    property double characterw:0
    property double characterh:0
    property int maxvalue: 0


    property int equals: 2
    property int var1: 0
    property int var2: 0
    property int moved: 0
    property int cookies: 0
    property int attack: 0
    property int taken: 0
    property int total: 0
    property int selected: 0

    property int wrong:0

    property int tried: 0

    property int theenemy: 0



    //onVisibleChanged: Scripts.mathequations();


    Timer {
        id:firstrun
        interval: 2000
        running:true
        repeat:false
        onTriggered: themenu.state = "Show"
    }

        Rectangle {
            anchors.fill: parent
            color:"lightyellow"

        }


        BackGround {
            id:background

        }



        PlayField {
            id:gamefield

            height:parent.height * 0.78
            width:parent.height * 1.025

            anchors.centerIn: parent

            state:"Hide"

        }

        CourseMap {
            id:thecourse
            visible:true
            anchors.fill:gamefield



        }

        Title {
            id:title
            anchors.top:gamefield.top
            anchors.bottomMargin:parent.height * 0.04
            anchors.right: parent.right
            anchors.margins: parent.height * 0.008
            height:parent.height * 0.04
            width:parent.width- gamefield.width - gamefield.x
            name:"Level "+lvl+":\n"+ mathy

            state:"Hide"
        }

        Image {
            id:bb
            anchors.left:parent.left
            anchors.top:parent.top
            anchors.margins: parent.height * 0.01
            height:parent.height * 0.20
            width:parent.height * 0.20
            source:"./graphics/back.png"
            rotation: 0.1

            visible:false

            MouseArea {
                anchors.fill:parent
                onClicked:gamefield.state = "Hide",themenu.state = "Show"
            }

        }

        EndScreen  {
            id:end
            anchors.fill:parent
            visible:false

        }


        Info {
            id:tillfinished
            anchors.left:parent.left
            anchors.top:bb.bottom
            height:parent.height * 0.05
            width:parent.width * 0.1
            name:"Left: "+answersleft

            state:"Hide"

        }



        Player {
            id:player
            x:0 + gamefield.x
            y:0 + gamefield.y
            width: gridheight / 10
            height: gridheight / 10

        }

        Enemy {
            id:enemy
            anchors.bottom:parent.bottom
            //anchors.left:parent.left
            anchors.margins:parent.height * 0.001

            height:parent.height * 0.5
            width:parent.height * 0.5

            state:if(lvl >= 2) {"Show"} else {"Hide"}

            currentenemy: if(lvl % 2 == 0) {"mechaheart"} else {"frankly"}

        }

        Lives {
            id:livecounter
            anchors.bottom:parent.bottom
            anchors.right:parent.right
            anchors.margins:parent.height * 0.001

            height:parent.height * 0.4
            width:parent.height * 0.4

            state:"Hide"

        }

        NNMenu {
            id:themenu
            anchors.horizontalCenter:parent.horizontalCenter
            width:parent.width * 0.40
            height:parent.height * 0.80

            //state:"Show"

        }

        Credits {
            id:credits
            visible:false
            anchors.centerIn: parent
            width:parent.height * 0.9
            height:parent.height * 0.9
        }

        Audio {
               id: playCount
               source:switch(selected) {
                      case 1: "sounds/1.wav";break;
                      case 2: "sounds/2.wav";break;
                      case 3: "sounds/3.wav";break;
                      case 4: "sounds/4.wav";break;
                      case 5: "sounds/5.wav";break;
                      case 6: "sounds/6.wav";break;
                      case 7: "sounds/7.wav";break;
                      case 8: "sounds/8.wav";break;
                      case 9: "sounds/9.wav";break;
                      case 10: "sounds/10.wav";break;
                      }

              // volume:1
              // autoLoad: true
               autoPlay: true



           }

        Audio {
                id:nope
                source:if(wrong == 1) {"sounds/wrong.wav"} else {"sounds/no.wav"}
                //autoLoad:true
                autoPlay:if(moved !=0) {true} else {false}


        }

       MediaPlayer {
            id:playMusic
            source:"sounds/Breezing By.mp3"
            //autoLoad:true
            //autoPlay:true
            //loops: MediaPlayer.Infinite


            volume: 0.1

        }

       property int tracking: 0
       Timer {
           id:check
           interval:1000
           repeat:true
           running:true
           onTriggered: if(playMusic.duration / 1000 > tracking+1) {playMusic.play(),tracking = tracking +1} else {tracking =0,playMusic.seek(0),playMusic.play()}
       }

}

