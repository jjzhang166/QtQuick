//image button with clicked and longPressed signal
//when "onPressAndHold" is triggered, "onClicked" will not be triggered
//parameters in: imgNormal, imgPressed
//signal out: btnClicked, longPressed

import QtQuick 2.0

Image {
    property string imgNormal
    property string imgPressed
    signal btnClicked
    signal longPressed
    source: imgNormal
    MouseArea {
        anchors.fill: parent
        onPressed: parent.source = imgPressed
        onReleased: parent.source = imgNormal
        onPressAndHold: longPressed()
        onClicked: btnClicked()
    }
}
