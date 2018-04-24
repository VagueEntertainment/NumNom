var component;
var ecomponent;
var icomponent;
var excomponent;
var tilenum = 0;

var  maxColumn = 8;
var maxRow = 6;
var  maxIndex = maxRow * maxColumn;


var tiles = new Array(maxIndex);
var ctiles = new Array(maxIndex);


function playgrid(width,height) {


    var tilenum = 0;

      //tiles = new Array(maxIndex);

    //Initialize Board

    //console.log("loading grid " + width+ " "+height);

     if(mapcreated == 0) {
    for (var column = 0; column < maxColumn; column++) {
       for (var row = 0; row < maxRow; row++) {

            createBlock(column, row, tilenum,thefield,width,height);
             tilenum= tilenum +1;
        }
    }
    mapcreated = 1;
     }

}



function coursegrid(width,height) {


    var tilenum = 0;

      //tiles = new Array(maxIndex);

    //Initialize Board

     if(cmapcreated == 0) {
    for (var column = 0; column < maxColumn; column++) {
       for (var row = 0; row < maxRow; row++) {

            ccreateBlock(column, row, tilenum,thecourse,width,height);
             tilenum= tilenum +1;
        }
    }
   cmapcreated = 1;
     }

}

function createBlock(column,row,num,area,width,height) {

    if (component == null)
       component = Qt.createComponent("./Tile.qml");


    if (component.status == Component.Ready) {
        var dynamicObject = component.createObject(area);
        if (dynamicObject == null) {
            console.log("error creating block");
            console.log(component.errorString());
            return false;
        }
        var blockSizex = height / maxColumn ;
        var blockSizey = height / maxColumn ;




        dynamicObject.x =(column * blockSizex);
        dynamicObject.y =(row * blockSizey);

        dynamicObject.width = blockSizex * 1.0;
        dynamicObject.height = blockSizey *1.0;

        dynamicObject.num = num;
        dynamicObject.row = row;
        dynamicObject.column = column;





       tiles[num] = dynamicObject;




    } else {
        console.log("error loading block component");
        console.log(component.errorString());
        return false;
    }

    return true;
}


function ccreateBlock(column,row,num,area,width,height) {

    if (component == null)
       component = Qt.createComponent("./CourseTile.qml");


    if (component.status == Component.Ready) {
        var dynamicObject = component.createObject(area);
        if (dynamicObject == null) {
            console.log("error creating block");
            console.log(component.errorString());
            return false;
        }
        var blockSizex = height / maxColumn ;
        var blockSizey = height / maxColumn ;




        dynamicObject.x =(column * blockSizex);
        dynamicObject.y =(row * blockSizey);

        dynamicObject.width = blockSizex * 1.0;
        dynamicObject.height = blockSizey *1.0;

        dynamicObject.num = num;
        dynamicObject.row = row;
        dynamicObject.column = column;



       ctiles[num] = dynamicObject;




    } else {
        console.log("error loading block component");
        console.log(component.errorString());
        return false;
    }

    return true;
}


function fillmap(mode) {
    var num = 0;
     maxvalue = 10;
    switch (gamemode) {
    case "Easy": maxvalue = 10;break;
    case "Medium": maxvalue = 50;break;
    case "Hard": maxvalue = 100;break;
    default:break;
    }

    while(num < maxIndex) {
        tiles[num].number = (Math.floor((Math.random() * maxvalue) + 1) );
        tiles[num].correct = 0;
        tiles[num].tdestroyed = 0;

        num = num + 1;
    }

}

function mathequations() {

    var type = Math.floor((Math.random() * 6) + 1);
    equals = Math.floor((Math.random() * maxvalue) + 1)


        if(type == 3 || type == 4) {
            equals = Math.floor((Math.random() * (maxvalue / 2)) + 2)
        }

        if(type == 5 ) {
          //  console.log("Addition");
             equals = Math.floor((Math.random() * maxvalue) + 2)
                while(var1 + var2 != equals) {
                 //  equals = Math.floor((Math.random() * maxvalue) + 2)
                   var1 = Math.floor((Math.random() * maxvalue ) +1)
                   var2 = Math.floor((Math.random() * maxvalue ) + 1)
                  //  console.log(var1+" + " +var2+" !=" + equals);
                }
        }

        if(type == 6 ) {
          //  console.log("subtraction");
             equals = Math.floor((Math.random() * maxvalue) + 1)
              while(var2 - var1 != equals) {
                  // equals = Math.floor((Math.random() * maxvalue) + 0)
                     var1 = Math.floor((Math.random() * maxvalue ) + 0)
                      var2 = Math.floor((Math.random() * maxvalue ) + 1)
                     //   console.log(var2+" - " +var1+" !=" + equals);
                    }
                }



        switch(type) {
        case 1: mathy = "Find Odd Numbers"; break;
        case 2: mathy = "Find Even Numbers";break;
        case 3: mathy = "Count by "+equals;break;
        case 4: mathy = equals+ " + "+equals;break;
        case 5: mathy = var1+ " + "+var2;break;
        case 6: mathy = var2+ " - "+var1;break;
        case 7: mathy = "Count by: "+equals;break;

        case 9: mathy = "Equals"+ Math.floor((Math.random() * 10) + 1) + "+" + Math.floor((Math.random() * 10) + 1); break;
        default:break;
        }

}

// tiles[tilenum].targeted == false

function checkequation(number,tilenum) {

    switch(mathy) {
    case "Find Even Numbers":  if(number % 2 == 0 && tiles[tilenum].correct == false )
        {tiles[tilenum].correct = true;
               if(tiles[tilenum].targeted == false) {
                 cookies = cookies + 1;answersleft = answersleft -1;
                        } else {taken = taken +1;answersleft = answersleft -1;tiles[tilenum].targeted =false}
              } else {if(tiles[tilenum].correct == false && tiles[tilenum].targeted == false)
                    {lives = lives -1}
                            };break;

    case "Find Odd Numbers" :  if(number % 2 != 0 && tiles[tilenum].correct == false)
                                    {tiles[tilenum].correct = true;
                                           if(tiles[tilenum].targeted == false) {
                                             cookies = cookies + 1;answersleft = answersleft -1;
                                                    } else {taken = taken +1;answersleft = answersleft -1;tiles[tilenum].targeted =false}
                                          } else {if(tiles[tilenum].correct == false && tiles[tilenum].targeted == false)
                                                {lives = lives -1}
                                                        };break;

    case "Count by "+equals :if(number % equals == 0 && tiles[tilenum].correct == false )
        {tiles[tilenum].correct = true;
               if(tiles[tilenum].targeted == false) {
                 cookies = cookies + 1;answersleft = answersleft -1;
                        } else {taken = taken +1;answersleft = answersleft -1;tiles[tilenum].targeted =false}
              } else {if(tiles[tilenum].correct == false && tiles[tilenum].targeted == false)
                    {lives = lives -1}
                            };break;

    case equals+ " + "+equals :if(number == equals + equals && tiles[tilenum].correct == false )
        {tiles[tilenum].correct = true;
               if(tiles[tilenum].targeted == false) {
                 cookies = cookies + 1;answersleft = answersleft -1;
                        } else {taken = taken +1;answersleft = answersleft -1;tiles[tilenum].targeted =false}
              } else {if(tiles[tilenum].correct == false && tiles[tilenum].targeted == false)
                    {lives = lives -1}
                            };break;


    case var1+ " + "+var2 :if(number == equals && tiles[tilenum].correct == false )
        {tiles[tilenum].correct = true;
               if(tiles[tilenum].targeted == false) {
                 cookies = cookies + 1;answersleft = answersleft -1;
                        } else {taken = taken +1;answersleft = answersleft -1;tiles[tilenum].targeted =false}
              } else {if(tiles[tilenum].correct == false && tiles[tilenum].targeted == false)
                    {lives = lives -1}
                            };break;



    case var2+ " - "+var1 :if(number == equals && tiles[tilenum].correct == false )
        {tiles[tilenum].correct = true;
               if(tiles[tilenum].targeted == false) {
                 cookies = cookies + 1;answersleft = answersleft -1;
                        } else {taken = taken +1;answersleft = answersleft -1;tiles[tilenum].targeted =false}
              } else {if(tiles[tilenum].correct == false && tiles[tilenum].targeted == false)
                    {lives = lives -1}
                            };break;




    }
    if(tiles[tilenum].correct == true && tiles[tilenum].targeted == false) {selected = number}
    if(tiles[tilenum].correct == false && tiles[tilenum].targeted == false) {if (wrong == 0) {wrong = 1} else {wrong = 0}}

    tiles[tilenum].targeted = false;

    if(answersleft <= 0) {
        winlose = 1;
        end.visible = true;
    }

    if(lives == 0) {
        winlose = 0;
         end.visible = true;
    }

    tileselected = -1;
    thenumber = -1;

}

function totalcorrect() {
    var num = 0;
    while(num < maxIndex) {

        switch(mathy) {
        case "Find Even Numbers": if(tiles[num].number % 2 == 0) {answersleft = answersleft +1;total = total +1;};break;
        case "Find Odd Numbers" :  if(tiles[num].number % 2 != 0) {answersleft = answersleft +1;total = total +1;};break;
        case "Count by "+equals : if(tiles[num].number % equals == 0){answersleft = answersleft +1;total = total +1;};break;
        case equals+ " + "+equals : if(tiles[num].number == equals + equals){answersleft = answersleft +1;total = total +1;};break;
        case var1+ " + "+var2 : if(tiles[num].number == equals){answersleft = answersleft +1;total = total +1;};break;
        case var2+ " - "+var1 : if(tiles[num].number == equals){answersleft = answersleft +1; total = total +1;};break;
        }


        num = num+1;
    }

    if( answersleft == 0 && moved == 0) {

            mathequations();

            totalcorrect();
            tried = tried + 1;
            if(tried >= 6) {
                fillmap();
            }

    } else { tried = 0;}
}

function playgame() {

    if(lvl == 1) {
    lives = 3;
    }

        mathequations();



    newgame = 1;
    themenu.state = "Hide";
    tillfinished.state = "Show";
    title.state = "Show";
    gamefield.state = "Show";
    livecounter.state = "Show";
    if(lvl > 3) {enemy.state = "Show"}
    cookies = 0;
    taken = 0;
    attack = 0;
    moved = 0;


    //console.log("starting new game");



}

function charactermove(x,y,width,height) {



    player.x = x + gamefield.x;
    player.y = y + gamefield.y;
    player.width = width;
    player.height = height;

   // if(newlocation > currentlocation) {
  //      player.loR = 1;
  //  } else { player.loR = 0; }

 //   player.state = "Show";

}

function attacking () {
    var num = 0;

    var attact_num = Math.floor((Math.random() * 10) + 1);
    var target;

    if(theenemy == 0) {
    while (num < attact_num) {
            target = Math.floor((Math.random() * maxIndex) + 1);
            if(tiles[tilenum].correct != true) {

                    if(tiles[target].correct != true) {
                     tiles[target].targeted = true;
                    }

            }

        num = num + 1;
    }
    }

    if(theenemy == 1) {

        target = Math.floor((Math.random() * maxIndex) + 1);

        if(tiles[target-1].correct != true && target-1 > 0) {
            tiles[target-1].targeted = true;
        }

        if(tiles[target-maxRow].correct != true && target-maxRow > 0) {
            tiles[target-maxRow].targeted = true;
        }

     if(tiles[target].correct != true) {
              tiles[target].targeted = true;

     }

     if(tiles[target+1].correct != true && target+1 < maxIndex) {
        tiles[target+1].targeted = true;
     }

     if(tiles[target+maxRow].correct != true && target+maxRow < maxIndex) {
         tiles[target+maxRow].targeted = true;
     }


    }



    targetted.interval = Math.floor((Math.random() * 8000) + 5000);



}

