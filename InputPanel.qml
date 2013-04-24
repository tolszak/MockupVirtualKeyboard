import QtQuick 2.0
import QtQuick.Window 2.0
import "."

Item {
    id:root
    width: Screen.width
    height: Screen.height

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.inputMethod.hide()

    }
    KeyModel {
        id:keyModel
    }
    FontLoader {
        source: "FontAwesome.otf"
    }
    QtObject {
        id:pimpl
        property bool shiftModifier: false
        property bool symbolModifier: false
        property int verticalSpacing: 10
        property int horizontalSpacing: 5
        property int rowHeight: keyboard.height/4 - verticalSpacing
        property int buttonWidth:  (keyboard.width-column.anchors.margins)/10 - horizontalSpacing
    }

    Component {
        id: keyButtonDelegate
        KeyButton {
            width: pimpl.buttonWidth
            height: pimpl.rowHeight
            text: (pimpl.shiftModifier) ? letter.toUpperCase() : (pimpl.symbolModifier)?firstSymbol : letter
            onClicked: keyEventDispatcher.sendKeyToFocusItem(text)
        }
    }

    Rectangle {
        id:keyboard
        color:"grey"
        width:parent.width
        height: parent.height/3
        anchors.bottom: parent.bottom
        MouseArea {
            anchors.fill: parent
        }

        Column {
            id:column
            anchors.margins: 5
            anchors.fill: parent
            spacing: pimpl.verticalSpacing

            Row {
                height: pimpl.rowHeight
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                Repeater {
                    model: keyModel.firstRowModel
                    delegate: keyButtonDelegate
                }
            }
            Row {
                height: pimpl.rowHeight
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                Repeater {
                    model: keyModel.secondRowModel
                    delegate: keyButtonDelegate
                }
            }
            Item {
                height: pimpl.rowHeight
                width:parent.width
                KeyButton {
                    anchors.left: parent.left
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    font.family: "FontAwesome"
                    textColor: (pimpl.shiftModifier)? "yellow": "black"
                    text: "\uf0aa"
                    onClicked: {
                        if (pimpl.symbolModifier) {
                            pimpl.symbolModifier = false
                        }
                        pimpl.shiftModifier = !pimpl.shiftModifier
                    }
                }
                Row {
                    height: pimpl.rowHeight
                    spacing: pimpl.horizontalSpacing
                    anchors.horizontalCenter:parent.horizontalCenter
                    Repeater {
                        anchors.horizontalCenter: parent.horizontalCenter
                        model: keyModel.thirdRowModel
                        delegate: keyButtonDelegate
                    }
                }
                KeyButton {
                    anchors.right: parent.right
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: "\uf060"
                    onClicked: keyEventDispatcher.sendKeyToFocusItem("\x7F")

                }
            }
            Row {
                height: pimpl.rowHeight
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                KeyButton {
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    font.family: "FontAwesome"
                    text: "\uf078"
                    onClicked: {
                        Qt.inputMethod.hide()
                    }
                }
                KeyButton {
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: ""
                }
                KeyButton {
                    width: pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: ","
                    onClicked: keyEventDispatcher.sendKeyToFocusItem(text)
                }
                KeyButton {
                    width: 3*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: " "
                    onClicked: keyEventDispatcher.sendKeyToFocusItem(text)
                }
                KeyButton {
                    width: pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: "."
                    onClicked: keyEventDispatcher.sendKeyToFocusItem(text)
                }
                KeyButton {
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: (!pimpl.symbolModifier)? "12#" : "ABC"
                    onClicked: {
                        if (pimpl.shiftModifier) {
                            pimpl.shiftModifier = false
                        }
                        pimpl.symbolModifier = !pimpl.symbolModifier
                    }
                }
                KeyButton {
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: "Enter"
                    onClicked: keyEventDispatcher.sendKeyToFocusItem("\n")
                }
            }
        }
    }
}
