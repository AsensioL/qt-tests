import QtQuick
import QtQuick.Controls

//ApplicationWindow {
//    visible: true
//    //width: 640
//    //height: 480
//    //visibility: Window.FullScreen
//
//    // Your other QML content here
//}


ApplicationWindow {
    id:       mainWindow
    visible:  true
    title:    "Animation App"

    // Main QML content goes here
    Item {
        width: parent.width // Match window width
        height: parent.height // Match window height

        Rectangle {
            id: rect
            width: 100; height: 100
            color: "red"

            Text {
                anchors.centerIn: parent
                text: "Click me"
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }

            states: State {
                name: "moved"; when: mouseArea.pressed
                PropertyChanges { target: rect; x: 50; y: 50 }
            }

            transitions: Transition {
                NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            }
        }

    }
}