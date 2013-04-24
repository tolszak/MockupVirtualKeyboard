import QtQuick 2.0

Item {
    id:root
    property color color: "lightsteelblue"
    property alias text: txt.text
    property alias font: txt.font
    property alias textColor: txt.color
    signal clicked()
    signal pressed()
    signal released()

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: buttonMouseArea.pressed ? Qt.darker(root.color, 1.5) : root.color
        Text {
            id: txt
            anchors.margins: 2
            anchors.fill: parent
            fontSizeMode: Text.Fit
            font.pixelSize: 500
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
            onClicked: root.clicked()
            onPressed: root.pressed()
            onReleased: root.released()
        }
    }
}
