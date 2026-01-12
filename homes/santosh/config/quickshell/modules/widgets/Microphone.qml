import QtQuick
import Quickshell

WidgetButton {
    text: "\udb80\udf6c"

    // Left click: toggle mute, like waybar mic mute key.
    onLeftClicked: Quickshell.execDetached(["sh", "-lc", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"])

    // Right click: open pavucontrol Input Devices (tab 4) like you had.
    onRightClicked: Quickshell.execDetached(["sh", "-lc", "pavucontrol --tab=4"])

    onWheelUp: Quickshell.execDetached(["sh", "-lc", "wpctl set-volume -l 1 @DEFAULT_SOURCE@ .05+"])
    onWheelDown: Quickshell.execDetached(["sh", "-lc", "wpctl set-volume @DEFAULT_SOURCE@ .05-"])
}
