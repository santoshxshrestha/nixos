import QtQuick
import Quickshell

WidgetButton {
    text: "\uf522"

    onWheelUp: Quickshell.execDetached(["sh", "-lc", "brightnessctl s 5%+"])
    onWheelDown: Quickshell.execDetached(["sh", "-lc", "brightnessctl s 5%-"])
}
