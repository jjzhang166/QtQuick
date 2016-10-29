//basic image button with normal and pressed states
//parameters in: imgNormal, imgPressed
//signal out: btnClicked

import QtQuick 2.0

Image {
    property string imgNormal
    property string imgPressed
    signal btnClicked
    source: imgNormal
    MouseArea {
        anchors.fill: parent
        onPressed: parent.source = imgPressed
        onReleased: parent.source = imgNormal
        onClicked: btnClicked()
    }
}
