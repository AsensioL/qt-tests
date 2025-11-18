import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 800
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
            color: "lightgrey"
            radius: 8
            clip: true // Hide rolodex beyond this item
            border {
                color: "black"
                width: 1
            }

            PathView {
                id: rolodex
                anchors.fill: parent
                model: 25 // numbers 0 through 9
                interactive: true
                snapMode: PathView.SnapToItem
                highlightRangeMode: PathView.StrictlyEnforceRange
                preferredHighlightBegin: 1/2 // keep the highligth vertically centered
                preferredHighlightEnd:   1/2 // keep the highligth vertically centered
                currentIndex: window.value


                property real visibleElements: 4 // how many items to show at once

                // Extend path beyond visible area so numbers don't overlap
                path: Path {
                    startX:       displayArea.width/2;    startY: -(rolodex.model-rolodex.visibleElements)/2 * displayArea.height/rolodex.visibleElements
                    PathLine { x: displayArea.width/2;    y:       (rolodex.model-rolodex.visibleElements)/2 * displayArea.height/rolodex.visibleElements + displayArea.height}
                }

                onCurrentIndexChanged: window.value = currentIndex

                delegate: Item {
                    // Change Item to Rectangle and add `color: Qt.rgba(1, 0, 0, 0.15)` to check for overlap
                    width: displayArea.width // use the full width so they can be clicked from the full width
                    height: displayArea.height/rolodex.visibleElements
                    Text {
                        text: index
                        color: index == rolodex.currentIndex ? "black" : "grey"
                        font.pixelSize: 20
                        anchors.centerIn: parent
                    }
                }

                highlight: Rectangle {
                    width: displayArea.width
                    height: displayArea.height/rolodex.visibleElements
                    color: "lightgreen"
                    opacity: 0.5
                    radius: 8
                }
            }
        }

        Button {
            text: "▼"
            onClicked: {
                console.log("asdf")
                nextValue()
            }
            width: 60; height: 40
        }

        Text {
            text: "Selected: " + value
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
