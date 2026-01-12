import QtQuick
import Quickshell

WidgetButton {
    text: "\udb81\udd7f"

    onLeftClicked: Quickshell.execDetached(["sh", "-lc", "pavucontrol"])
    onRightClicked: Quickshell.execDetached(["sh", "-lc", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"])

    onWheelUp: Quickshell.execDetached(["sh", "-lc", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"])
    onWheelDown: Quickshell.execDetached(["sh", "-lc", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"])
}
