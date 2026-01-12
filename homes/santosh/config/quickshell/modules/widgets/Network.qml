import QtQuick
import Quickshell

import "../../services" as Services

WidgetButton {
    id: root

    // Match Waybar icons:
    // - wifi connected: \uf1eb
    // - ethernet connected: \udb80\ude00
    // - disconnected: \udb82\udd2e
    text: {
        if (!Services.Network.connected) return "\udb82\udd2e";
        if (Services.Network.primaryType === "ethernet") return "\udb80\ude00";
        return "\uf1eb";
    }

    // Match Waybar disconnected look.
    label.color: Services.Network.connected ? "#f0f0f0" : "#ff8a80"

    onLeftClicked: Quickshell.execDetached(["sh", "-lc", "nm-connection-editor"])
}
