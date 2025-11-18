import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window
    visible: true
    width: 200
    height: 300
    title: "Rolodex Number Selector"

    property int value: 0

    function nextValue() { value = (value + 1) % 10 }
    function prevValue() { value = (value + 9) % 10 }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Button {
            text: "▲"
            onClicked: prevValue()
            width: 60; height: 40
        }

        Rectangle {
            id: displayArea
            width: 100; height: 100
            color: "#f0f0f0"
            radius: 8
            clip: true

            PathView {
                id: rolodex
                anchors.fill: parent
                model: 10
                interactive: true
                snapMode: PathView.SnapToItem
                pathItemCount: 5
                highlightRangeMode: PathView.StrictlyEnforceRange
                preferredHighlightBegin: displayArea.height/3
                preferredHighlightEnd: displayArea.height*2/3
                currentIndex: window.value
                focus: true

                // Extend path beyond visible area so items don't overlap
                path: Path {
                    startX: displayArea.width/2; startY: -displayArea.height/3
                    PathLine { x: displayArea.width/2; y: displayArea.height + displayArea.height/3 }
                }

                onCurrentIndexChanged: window.value = currentIndex

                delegate: Item {
                    width: displayArea.width
                    height: displayArea.height/3
                    Text {
                        text: index
                        font.pixelSize: 40
                        anchors.centerIn: parent
                    }
                }

                highlight: Rectangle {
                    width: displayArea.width
                    height: displayArea.height/3
                    color: "lightblue"
                    radius: 8
                    x: 0; y: displayArea.height/3
                }
            }
        }

        Button {
            text: "▼"
            onClicked: nextValue()
            width: 60; height: 40
        }

        Text {
            text: "Selected: " + value
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
