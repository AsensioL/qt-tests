import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

//ApplicationWindow {
//    visible: true
//    //width: 640
//    //height: 480
//    //visibility: Window.FullScreen
//
//    // Your other QML content here
//}


ApplicationWindow {
    id:       myMainWindow
    visible:  true
    title:    "Object location test App"
    width: 1280
    height: 720

    // Main QML content goes here
    ColumnLayout {
        id:      myColumnObject
        spacing: 20


        Repeater {
            model: [
                {"bg": "red",   "tc": "#00FFFF"},
                {"bg": "green", "tc": "#FF00FF"},
                {"bg": "blue",  "tc": "#FFFF00"}
            ]

            delegate: Rectangle {
                required property var modelData

                width: 200
                height: 50
                color: modelData["bg"]

                Text {
                    anchors.centerIn: parent
                    text: "Click me"
                    color: modelData["tc"]
                    font.pointSize: 12
                    renderType: Text.NativeRendering
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: console.log("Pressed")
                }
            }
        }

        Button {
            id: myButton
            text: "This is a button"
        }


        Text {
            text: "Graphics API: " + graphicsInfo.graphicsApi
            font.pixelSize: 20
        }

        Text {
            text: "Platform Name: " + graphicsInfo.platformName
            font.pixelSize: 20
        }


    }
}