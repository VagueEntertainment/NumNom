import QtQuick 2.8
import "main.js" as Scripts

Item {

    id:course

    visible:false

    onVisibleChanged:if(cmapcreated == 0) {Scripts.coursegrid(gridwidth,gridheight)}



}

