//text bouncing back and forth
//with customizable scrollSpeed, pauseTime and timeBeforeStart
//automatically determine to scroll or anchors.horizontalCenter
//parameters in: height, width, text, [scrollSpeed, pauseTime, timeBeforeStart]

import QtQuick 2.0

Item {
    id: root
    clip: true
    property alias text: textId.text
    property int scrollSpeed: 20
    property int pauseTime: 2000
    property int timeBeforeStart: 1000

    Text {
        id: textId
        states: [
            State {
                name: "anchorLeft"
                AnchorChanges {
                    target: textId
                    anchors.left: root.left
                }
            },
            State {
                name: "anchorRight"
                AnchorChanges {
                    target: textId
                    anchors.right: root.right
                }
            },
            State {
                name: "anchorCenter"
                AnchorChanges {
                    target: textId
                    anchors.horizontalCenter: root.horizontalCenter
                }
            }
        ]
        transitions: [
            Transition {
                from: "anchorLeft"
                to: "anchorRight"
                reversible: true
                AnchorAnimation {
                    id: anchorAnimation
                    duration: scrollSpeed * Math.abs(textId.implicitWidth - root.width)
                }
            }
        ]
        Timer {
            id: masterTimer
            repeat: true
            triggeredOnStart: true
            interval: anchorAnimation.duration + pauseTime
            onTriggered: {
                if(textId.state == "anchorRight")
                    textId.state = "anchorLeft"
                else
                    textId.state = "anchorRight"
            }
        }
        Timer {
            id: initTimer
            interval: timeBeforeStart
            onTriggered: masterTimer.start()
        }
    }
    Component.onCompleted: {
        if(textId.implicitWidth > root.width) {
            textId.state = "anchorLeft"
            initTimer.start()
        }
        else {
            textId.state = "anchorCenter"
        }
    }
}
