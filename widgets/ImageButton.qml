// when presse and move a button in Flickable(ListView, GridView) will not emit released(), but canceled()
// when pressAndHold() is triggered, clicked() will not be emitted

import QtQuick 2.0

Image {
    property string imgNormal
    property string imgPressed
    signal btnLongPressed
    signal btnClicked

    source: imgNormal
    MouseArea {
        anchors.fill: parent
        onPressed: parent.source = imgPressed
        onReleased: parent.source = imgNormal
        onCanceled: parent.source = imgNormal
        onPressAndHold: btnLongPressed()
        onClicked: btnClicked()
    }
}
