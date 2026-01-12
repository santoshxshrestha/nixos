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

    // Placeholder until Niri workspace API is wired.
    Repeater {
        model: Services.Niri.workspaces.length ? Services.Niri.workspaces : [
            { id: 1, idx: 1, isActive: true, activeWindowId: 1 },
            { id: 2, idx: 2, isActive: false, activeWindowId: 1 },
            { id: 3, idx: 3, isActive: false, activeWindowId: 0 },
        ]

        WidgetButton {
            required property var model

            implicitWidth: 32
            active: model.isActive

            text: {
                const index = model.idx ?? model.index ?? model.id;
                const icon = root.icons[index] ?? String(index);
                const isActiveButNotFocused = !model.isActive && (model.activeWindowId ?? 0) > 0;
                return model.isActive ? icon : (isActiveButNotFocused ? "\uf111" : "\uf10c");
            }

            onLeftClicked: Services.Niri.focusWorkspaceById(model.id)
        }
    }
}
