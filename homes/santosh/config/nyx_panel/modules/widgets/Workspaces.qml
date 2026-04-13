import QtQuick
import QtQuick.Layouts

import "../../services" as Services

ColumnLayout {
    id: root
    spacing: 4

    // Map workspace index -> icon.
    readonly property var icons: ({
        1: "\uf120",       // terminal
        2: "\udb80\ude39", // firefox
        3: "3",
        4: "4",
        5: "5",
        6: "6",
        7: "7",
        8: "8",
        9: "9",
        10: ""
    })

    Component.onCompleted: {
        // Keep a stable workspace list size for UI.
        if (Services.Niri.workspaces) Services.Niri.workspaces.maxCount = 10;
    }

    Repeater {
        model: Services.Niri.workspaces

        WidgetButton {
            id: wsButton
            required property var model
            implicitWidth: 32
            label.font.pixelSize: 20

            // Renamed to thisWsId to avoid clash with window role "workspaceId"
            property int thisWsId: model.id

            Repeater {
                id: windowRepeater
                model: Services.Niri.windows
                Item {
                    visible: false
                    // model.workspaceId = window's workspace
                    // wsButton.thisWsId  = this workspace's id
                    property bool belongsHere: model.workspaceId == wsButton.thisWsId
                    property bool isFocused: model.isFocused
                }
            }
            Text {
                anchors.centerIn: parent
                visible: !model.isActive
                text: "\udb82\udee3"
                font.pixelSize: 20  // big size for inactive icon
                color: label.color
            }

            Text {
                anchors.centerIn: parent
                visible: model.isActive
                text: {
                    var icons = "";
                    for (var i = 0; i < windowRepeater.count; i++) {
                        var win = windowRepeater.itemAt(i);
                        if (win?.belongsHere)
                                    // |   ┃   │   ▏   ▎   ▍   ▌
                            icons += win.isFocused ? "│"  : "╵";
                        }
                        return icons;
                }
                font.pixelSize: 13  // smaller size for window dots
                color: label.color
            }

            property real spinAngle: 0
            transform: Rotation {
                origin.x: width / 2
                origin.y: height / 2
                angle: (model.isActive && !Services.Config.disableWorkspaceSpin) ? spinAngle : 0
            }

            NumberAnimation on spinAngle {
                running: model.isActive && !Services.Config.disableWorkspaceSpin
                from: 0
                to: 360
                duration: 5000
                loops: Animation.Infinite
                onRunningChanged: if (!running) spinAngle = 0
            }

            onLeftClicked: Services.Niri.focusWorkspaceById(model.id)
        }
    }
}
