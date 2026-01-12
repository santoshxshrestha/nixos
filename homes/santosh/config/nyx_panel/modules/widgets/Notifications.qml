import QtQuick
import Quickshell

WidgetButton {
    text: "\uf0f3"

    onLeftClicked: Quickshell.execDetached(["sh", "-lc", "swaync-client -t -sw"])
    onRightClicked: Quickshell.execDetached(["sh", "-lc", "swaync-client -d -sw"])
}
