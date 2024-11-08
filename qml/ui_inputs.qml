import QtQuick
import QtQuick.Controls
import QtMultimedia

ApplicationWindow {
    id:       mainWindow
    visible:  true
    title:    "Animation App"
    width:  1280 + 100
    height:  720 + 100

    // Main QML content goes here
    Rectangle {
        width:  1280
        height:  720

        color: "darkgrey"

        Rectangle {
            id: container
            width:  900
            height: 500
            color: "pink"
            clip: true

            Rectangle { width: 30; height: 30; x: point1.x; y: point1.y; color: "red" }
            Rectangle { width: 30; height: 30; x: point2.x; y: point2.y; color: "green" }

            // WSL:     Only detects 1 finger
            // Lubuntu: Correctly detects multiple fingers
            MultiPointTouchArea {
                anchors.fill: parent
                touchPoints: [
                    TouchPoint { id: point1 },
                    TouchPoint { id: point2 }
                ]

                onPressed:      console.log("MultiPointTouchArea.onPressed")
                onReleased:     console.log("MultiPointTouchArea.onReleased")
                onTouchUpdated: console.log("MultiPointTouchArea.onTouchUpdated")
            }

            // WSL:     Correctly detects mouse wheel and location. BUT ALSO detects pinch and center on a touchscreen
            // Lubuntu: Correctly detects mouse wheel and location.
            /*WheelHandler {
                property: "rotation"
                onWheel: (wheel) => {
                    console.log(`This is WheelHandler.WheelHandler`)
                }
            }*/


            // WSL:     Correctly detects taps and clicks (without displacement)
            // Lubuntu: Correctly detects taps and clicks (without displacement)
            /*TapHandler {
                onTapped: (eventPoint) => {
                    console.log(`This is TapHandler.onTapped`)
                }
            }*/


            // WSL:     Not working
            // Lubuntu: Correctly detects scale change and translation
            // Notes:   Newer and preferred
            /*PinchHandler {
                id:                 pinch
                target:             null
                grabPermissions:    PointerHandler.TakeOverForbidden

                onActiveChanged: {
                    console.log(`PinchHandler.onActiveChanged`)
                }
                onScaleChanged: (delta) => {
                    console.log(`PinchHandler.onScaleChanged`)
                }

                onTranslationChanged: (delta) => {
                    console.log(`PinchHandler.onTranslationChanged`)
                }
            }*/

            // WSL:     Not working
            // Lubuntu: Correctly detects scale change, translation and rotation
            // Notes:   Newer and preferred
            /*PinchArea {
                anchors.fill: parent

                onPinchStarted:  console.log("PinchArea.onPinchStarted")
                onPinchUpdated:  (pEv) => console.log(`PinchArea.onPinchUpdated: C=${pEv.center}, S=${pEv.scale}, Rdec=${pEv.rotation}`)
                onPinchFinished: console.log("PinchArea.onPinchFinished")
            }*/
        }
    }
}