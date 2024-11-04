import QtQuick
import QtQuick.Controls
import QtMultimedia

ApplicationWindow {
    id:       mainWindow
    visible:  true
    title:    "Animation App"
    width:  1920
    height: 1080

    // Main QML content goes here
    Rectangle {
        width:  1280
        height:  720

        clip: true
        color: "darkgrey"

        //Component.onCompleted: mediaplayer.play()
        MediaPlayer {
            id: mediaplayer

            source: "/home/alorenzo/projects/qt-test/media/simpsons.mp4"
            audioOutput: AudioOutput {}
            videoOutput: videoOutput
        }

        VideoOutput {
            id: videoOutput
            width:  1280
            height:  720

            transform: [
                Scale {
                    id: zoomScale
                },
                Translate {
                    id: zoomTranslate
                }
            ]

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.AllButtons
                onClicked: (mouse) => {
                    if (mouse.button == Qt.LeftButton) {
                        console.log(`Pressed L x=${mouse.x}, y=${mouse.y}`)
                        zoomScale.origin.x = mouse.x;
                        zoomScale.origin.y = mouse.y;
                    }
                    else if (mouse.button == Qt.RightButton) {
                        console.log(`Pressed R x=${mouse.x}, y=${mouse.y}`)
                        videoOutput.scale = 2
                    }
                    else if (mouse.button == Qt.MiddleButton) {
                        console.log(`Pressed C x=${mouse.x}, y=${mouse.y}`)
                        zoomScale.origin.x = 0;
                        zoomScale.origin.y = 0;
                        zoomScale.xScale = 1;
                        zoomScale.yScale = 1;
                    }
                    else if (mouse.button == Qt.BackButton) {
                        console.log(`Pressed B x=${mouse.x}, y=${mouse.y}`)
                        zoomScale.xScale = zoomScale.xScale / 1.04;
                        zoomScale.yScale = zoomScale.yScale / 1.04;
                    }
                    else if (mouse.button == Qt.ForwardButton) {
                        console.log(`Pressed F x=${mouse.x}, y=${mouse.y}`)
                        zoomScale.xScale = zoomScale.xScale * 1.04;
                        zoomScale.yScale = zoomScale.yScale * 1.04;

                    }
                    else {
                        console.log(`Pressed ?: ${mouse.button}`)
                    }
                }
            }
        }

        Rectangle {
            id:     playButton

            width:  200
            height: 100
            color:  "green"

            Text {
                anchors.centerIn: parent
                text: "Start"
            }
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.AllButtons

                onClicked: (mouse) => {
                    if (mouse.button == Qt.LeftButton)  { mediaplayer.play()  }
                    if (mouse.button == Qt.RightButton) { mediaplayer.pause() }
                }
            }
        }


    }
}