import QtQuick
import QtQuick.Layouts

import Quickshell.Widgets
import Quickshell.Services.SystemTray

ColumnLayout {
    id: root

    spacing: 6

    Repeater {
        model: SystemTray.items

        delegate: WidgetButton {
            id: btn

            required property var modelData

            Layout.fillWidth: true

            text: ""

            IconImage {
                anchors.centerIn: parent
                implicitWidth: 18
                implicitHeight: 18
                source: modelData.icon

                enabled: false
            }

            onLeftClicked: modelData.activate()
            onRightClicked: modelData.secondaryActivate()

            onWheelUp: modelData.scroll(120, false)
            onWheelDown: modelData.scroll(-120, false)
        }
    }
}
