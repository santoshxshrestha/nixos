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
            required property var model

            implicitWidth: 32
            active: model.isActive

            // Slightly smaller glyph for workspace indicator.
            label.font.pixelSize: 20

            text: {
                const index = model.idx ?? model.index ?? model.id;
                // const workspaceIcon = root.icons[index] ?? String(index);
                const workspaceIcon = String("\udb82\udee5");

                // Focused: mapped icon. Others: inactive marker only.
                return model.isActive ? workspaceIcon : "\udb82\udee3";
            }

            onLeftClicked: Services.Niri.focusWorkspaceById(model.id)
        }
    }
}
