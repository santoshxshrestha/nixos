import QtQuick

Rectangle {
    id: root

    property var now: new Date()

    color: "#524f67"
    opacity: 0.20
    radius: 6

    implicitWidth: 32
    implicitHeight: 42

    Column {
        anchors.centerIn: parent
        spacing: 0

        Text {
            text: Qt.formatTime(root.now, "h")
            color: "#ffffff"
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 16
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Text {
            text: Qt.formatTime(root.now, "mm")
            color: "#ffffff"
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: root.opacity = 0.30
        onExited: root.opacity = 0.20
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }
}
