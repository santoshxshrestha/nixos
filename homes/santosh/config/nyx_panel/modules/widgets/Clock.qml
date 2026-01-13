import QtQuick

import "./" as Widgets

Widgets.WidgetButton {
    id: root

    property var now: new Date()

    // Keep WidgetButton's internal label empty; we'll render two lines.
    text: ""

    // Outer size includes some padding around text.
    implicitWidth: 38
    implicitHeight: 140

    // Padding inside the button.
    readonly property int paddingX: 2
    readonly property int paddingTop: 8
    readonly property int paddingBottom: 8

    Column {
        anchors {
            fill: parent
            leftMargin: root.paddingX
            rightMargin: root.paddingX
            topMargin: root.paddingTop
            bottomMargin: root.paddingBottom
        }
        spacing: 2

        Text {
            text: {
                let h = root.now.getHours();
                h = h % 12;
                if (h === 0) h = 12;
                return String(h).padStart(2, "0");
            }
            color: "#ffffff"
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Text {
            text: String(root.now.getMinutes()).padStart(2, "0")
            color: "#ffffff"
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        // seperator between time and date
        Rectangle {
            width: parent.width
            height: 3
            color: "#ffffff"
            opacity: 0.25
        }

        Text {
            text: Qt.formatDateTime(root.now, "ddd")
            color: "#ffffff"
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 14
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Text {
            text: Qt.formatDateTime(root.now, "d")
            color: "#ffffff"
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 14
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Text {
            text: Qt.formatDateTime(root.now, "MMM")
            color: "#ffffff"
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 14
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }
}
