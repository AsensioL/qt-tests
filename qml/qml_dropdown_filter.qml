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
        id: rect
        width:  1280
        height:  720

        color: "darkgrey"


        ListModel {
            id: fruitModel

            ListElement {
                name: "Apple"
                cost: 2.45
            }
            ListElement {
                name: "Orange"
                cost: 3.25
            }
            ListElement {
                name: "Banana"
                cost: 1.95
            }
            ListElement {
                name: "Strawberry"
                cost: 4.35
            }
        }

        property var numberModel: [1, 2, 3, 4, 5, 6, 7]
        property var filteredList: numberModel.filter(my_filter)
        property var filteredList2: numberModel.filter( (val) => val < 4 )

        function my_filter(val) {
            return val < 4
        }

        ComboBox {
            id: comboBox
            textRole:  "name"
            valueRole: "cost"
            currentIndex: -1

            model: fruitModel
        }

        Label {
            x: 150
            id: my_label
            text: comboBox.currentValue
        }

        Button {
            x: 200
            y: 200
            text: "Press to check if the filter functino works"
            onClicked: console.log(`${rect.filteredList2}`)
        }

        Button {
            x: 200
            y: 300
            text: "Press to check if the filter functino works"
            onClicked: {
                var filteredList3 = rect.numberModel.filter( (val) => val < 3 )
                console.log(`${filteredList3}`)
            }
        }


        // ComboBox {
        //     currentIndex: -1
        //     model: rect.numberModel.filter( (n) => n < 4 )
        // }
    }
}