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

        color: "darkgrey"

        Rectangle {
            id: container
            //width:  !ready ? 900 : Math.abs(p2.x - p1.x)
            //height: !ready ? 500 : Math.abs(p2.y - p1.y)
            width:  900
            height: 500
            color: "yellow"
            clip: true

            readonly property vector2d not_ready: Qt.point(0, 0)
            property vector2d p1: not_ready
            property vector2d p2: not_ready
            property bool ready: (p1 != not_ready) && (p2 != not_ready)

            Component.onCompleted: console.log(`${ready}, ${p1}, ${p2}`)

            Image {
                id: imagenCentro
                //x: 20
                //y: 20
                width:  800
                height: 400
                fillMode: Image.PreserveAspectCrop
                source: "data:image/jpeg;base64,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"

                transform: [
                    Scale {
                        id: zoom
                        property real increments: 1.1
                        property int  steps: 0

                        function setScale(newScale) {
                            zoom.xScale = newScale
                            zoom.yScale = newScale
                        }
                    },
                    Translate {
                        id: offset
                        property vector2d coord: Qt.vector2d(x, y)

                        function setCoord(point) {
                            offset.x = point.x
                            offset.y = point.y
                        }
                    }
                ]

                // Calculate the position of a pixel in the unscaled image corresponding to a
                // ViewPort pixel at the current settings of scale and offset
                function viewPortToImageCoord(viewPortCoord) {
                    var deltaX = viewPortCoord.x - offset.coord.x;
                    var deltaY = viewPortCoord.y - offset.coord.y;
                    var scale = zoom.xScale; // Assuming uniform scaling
                    return Qt.vector2d(deltaX / scale, deltaY / scale);
                }

                // Given a position in the unscaled image (imageCoord) and where it should be
                // in the ViewPort (viewPortCoord) at a given zoom level (newScale), calculate the
                // required offset.
                function calculateOffsetCoord(viewPortCoord, imageCoord, newScale) {
                    var x = viewPortCoord.x - imageCoord.x * newScale;
                    var y = viewPortCoord.y - imageCoord.y * newScale;
                    return Qt.vector2d(x, y);
                }

                function applyZoom(viewPortCoord, wheelAngleDelta) {
                    zoom.steps += wheelAngleDelta
                    //console.log(`viewPortCoord ${viewPortCoord}, wheelAngleDelta ${wheelAngleDelta}, zoom.steps ${zoom.steps}`)

                    var newScale       = Math.pow(zoom.increments, Math.round(zoom.steps / 120))
                    var imageCoord     = viewPortToImageCoord(viewPortCoord)
                    var newOffsetCoord = calculateOffsetCoord(viewPortCoord, imageCoord, newScale)
                    //console.log(`imageCoord=${imageCoord}, newScale=${newScale}, newOffsetCoord=${newOffsetCoord}`)

                    zoom.setScale(newScale)
                    offset.setCoord(newOffsetCoord)
                }

                function reset() {
                    zoom.setScale(1)
                    offset.setCoord(Qt.vector2d(0,0))
                }
            }


            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.AllButtons

                onWheel: (wheel) => {
                    var viewPortCoord = Qt.vector2d(wheel.x, wheel.y)
                    imagenCentro.applyZoom(viewPortCoord, wheel.angleDelta.y)
                }

                onClicked: (mouse) => {
                    if (mouse.button == Qt.LeftButton) {
                        var viewPortCoord = Qt.vector2d(mouse.x, mouse.y)
                        console.log(`ViewPort position: ${viewPortCoord}`)
                    }
                    else if (mouse.button == Qt.RightButton) {
                        var viewPortCoord = Qt.vector2d(mouse.x, mouse.y)
                        var imageCoord = imagenCentro.viewPortToImageCoord(viewPortCoord)
                        console.log(`Image position:    ${imageCoord}`)
                    }
                    else if (mouse.button == Qt.MiddleButton) {
                        imagenCentro.reset()
                    }
                }

                //onClicked: (mouse) => {
                //    if (mouse.button == Qt.LeftButton) {
                //        //console.log(`Pressed L x=${mouse.x}, y=${mouse.y}`)
                //        container.p1.x = mouse.x
                //        container.p1.y = mouse.y
                //        console.log(`Pressed ?: p1=${container.p1}, p2=${container.p2}`)
                //    }
                //    else if (mouse.button == Qt.RightButton) {
                //        //console.log(`Pressed R x=${mouse.x}, y=${mouse.y}`)
                //        container.p2.x = mouse.x
                //        container.p2.y = mouse.y
                //        console.log(`Pressed ?: p1=${container.p1}, p2=${container.p2}`)
                //    }
                //    else if (mouse.button == Qt.MiddleButton) {
                //        //console.log(`Pressed C x=${mouse.x}, y=${mouse.y}`)
                //        container.p1 = container.not_ready
                //        container.p2 = container.not_ready
                //        console.log(`Pressed ?: p1=${container.p1}, p2=${container.p2}`)
                //    }
                //    else {
                //        console.log(`Pressed ${mouse.button}: p1=${container.p1}, p2=${container.p2}`)
                //    }
                //}
            }
        }
    }
}