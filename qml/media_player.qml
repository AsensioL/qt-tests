import QtQuick
import QtQuick.Controls
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
    id:       mainWindow
    visible:  true
    title:    "Animation App"
    width: 1280
    height: 720

    // Main QML content goes here
    Item {
        width: 1280
        height: 720

        Component.onCompleted: mediaplayer.play()

        MediaPlayer {
            id: mediaplayer

            source: "/home/alorenzo/projects/qt-test/media/simpsons.mp4"
            audioOutput: AudioOutput {}
            videoOutput: videoOutput
        }

        VideoOutput {
            id: videoOutput
            anchors.fill: parent
        }

        Rectangle {
            width: 200
            height: 100
            color: "red"

            Text {
                anchors.centerIn: parent
                text: "Click me"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    console.log("Pressed")
                    mediaplayer.stop();
                }
            }
        }


    }
}