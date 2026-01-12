import QtQuick
import QtQuick.Layouts
import Quickshell

import "../../services" as Services

ColumnLayout {
    id: root
    spacing: 4

    // Map workspace index -> icon, from your waybar config.
    readonly property var icons: ({
        1: "\uf120",      // terminal
        2: "\udb80\ude39", // code
        3: "3",
        4: "4",
        5: "5",
        6: "6",
        7: "7",
        8: "8",
        9: "9",
        10: ""
    })

    Repeater {
        model: Services.Niri.workspaces

        WidgetButton {
            required property var model

            implicitWidth: 32
            active: model.isActive

            text: {
                // niri:workspaces provides workspace "idx" and stable "id".
                const index = model.idx ?? model.index ?? model.id;
                const workspaceIcon = root.icons[index] ?? String(index);

                // If focused: show workspace icon.
                // If not focused: show a simple state indicator only.
                // (You asked to *not* show app-specific/window-based indicators.)
                if (model.isActive) return workspaceIcon;
                return "\uf10c";
            }

            onLeftClicked: Services.Niri.focusWorkspaceById(model.id)
        }
    }
}
