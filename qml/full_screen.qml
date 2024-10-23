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
    id:             mainWindow
    visible: true
    // width: 1920 // Adjust to your desired resolution
    // height: 1080 // Adjust to your desired resolution
    title: "Full Screen App"

    // Main QML content goes here
    Item {
        width: parent.width // Match window width
        height: parent.height // Match window height

        Text {
            text: "Hello, World!"
            anchors.centerIn: parent
            font.pixelSize: 48
        }

    }

    Component.onCompleted: {
            mainWindow.showFullScreen()
    }
}