//continuous scrolling text
//which can be seen on most music player when music title is longer than display area
//with customizable scrollSpeed, pauseTime and timeBeforeStart
//automatically determine to scroll or anchors.horizontalCenter
//parameters in: height, width, text, [scrollSpeed, pauseTime, timeBeforeStart]

import QtQuick 2.0

Item {
    id: root
    clip: true
    property string text
    property string textWidth: text + "    "
    property int scrollSpeed: 20
    property int pauseTime: 2000
    property int timeBeforeStart: 1000

    Text {
        id: rootText
        text: text
        visible: false
    }
    Text {
        id: distacneText
        text: textWidth
        visible: false
    }
    Text {
        id: mainText
        text: root.text + "    " + root.text
        SequentialAnimation {
            id: animationId
            loops: Animation.Infinite
            NumberAnimation {
                target: mainText
                property: "x"
                duration: scrollSpeed * distacneText.implicitWidth
                //easing.type: Easing.InOutQuad
                from: 0
                to: -distacneText.implicitWidth
            }
            ParallelAnimation {
                PauseAnimation {duration: pauseTime}
                ScriptAction {script: {mainText.x = 0}}
            }
        }
        Timer {
            id: initTimer
            interval: timeBeforeStart
            onTriggered: animationId.start()
        }
    }
    Component.onCompleted: {
        if(rootText.implicitWidth > root.width) {
            initTimer.start()
        }
        else {
            mainText.text = root.text
            mainText.anchors.horizontalCenter = root.horizontalCenter
        }
    }
}
