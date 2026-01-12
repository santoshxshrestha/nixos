import QtQuick
import Quickshell
import Quickshell.Io

WidgetButton {
    id: root

    // Nerd Font icons (override if you want different glyphs)
    property string enabledIcon: "󰍬"
    property string disabledIcon: "󰍭"

    // Start optimistic; corrected on first poll.
    text: enabledIcon

    function refreshState() {
        micStateProc.running = true;
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: root.refreshState()
    }

    Process {
        id: micStateProc
        command: ["sh", "-lc", "wpctl get-volume @DEFAULT_AUDIO_SOURCE@"]

        stdout: StdioCollector {
            onStreamFinished: {
                const out = (this.text ?? "").trim();
                const muted = out.includes("MUTED");
                root.active = muted;
                root.text = muted ? root.disabledIcon : root.enabledIcon;
            }
        }

        stderr: StdioCollector {
            onStreamFinished: {
                // Ignore errors; keep current icon/state.
            }
        }
    }

    // Left click: toggle mute, like waybar mic mute key.
    onLeftClicked: {
        Quickshell.execDetached(["sh", "-lc", "pavucontrol --tab=4"])
        root.refreshState()
    }

    // Right click: open pavucontrol Input Devices (tab 4) like you had.
    onRightClicked: Quickshell.execDetached(["sh", "-lc", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"])

    onWheelUp: {
        Quickshell.execDetached(["sh", "-lc", "wpctl set-volume -l 1 @DEFAULT_SOURCE@ .05+"])
        root.refreshState()
    }

    onWheelDown: {
        Quickshell.execDetached(["sh", "-lc", "wpctl set-volume @DEFAULT_SOURCE@ .05-"])
        root.refreshState()
    }
}

