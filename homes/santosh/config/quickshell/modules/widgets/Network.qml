import QtQuick
import Quickshell

WidgetButton {
    text: "\uf1eb"

    onLeftClicked: Quickshell.execDetached(["sh", "-lc", "nm-connection-editor"])
}
