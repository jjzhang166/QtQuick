//press and hold, then drag in Flickable(ListView, GridView...But not Grid)
//will not emit "release" signal, but will emit "pressedButtonsChanged" signal
//parameters in: imgNormal, imgPressed
//signal out: btnClicked

import QtQuick 2.0

Image {
    property string imgNormal
    property string imgPressed
    signal btnClicked
    source: imgNormal
    property int counter: 0
    MouseArea {
        anchors.fill: parent
        onPressed: onPressed: parent.source = imgPressed
        onClicked: btnClicked()
        onPressedButtonsChanged: {
            if(counter === 1) {
                parent.source = imgNormal
                counter = 0
            }
            else counter++
        }
    }
}
