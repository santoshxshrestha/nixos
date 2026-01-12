import QtQuick
import Quickshell
import Quickshell.Io

WidgetButton {
    id: root

    // Nerd Font icons (override if you want different glyphs)
    property string unmutedIcon: "󰕾"
    property string mutedIcon: "󰝟"

    // Start optimistic; corrected on first poll.
    text: unmutedIcon

    function refreshState() {
        sinkStateProc.running = true;
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: root.refreshState()
    }

    Process {
        id: sinkStateProc
        command: ["sh", "-lc", "wpctl get-volume @DEFAULT_AUDIO_SINK@"]

        stdout: StdioCollector {
            onStreamFinished: {
                const out = (this.text ?? "").trim();
                const muted = out.includes("MUTED");
                root.active = muted;
                root.text = muted ? root.mutedIcon : root.unmutedIcon;
            }
        }

        stderr: StdioCollector {
            onStreamFinished: {
                // Ignore errors; keep current icon/state.
            }
        }
    }

    onLeftClicked: {
        Quickshell.execDetached(["sh", "-lc", "pavucontrol"])
    }

    onRightClicked: {
        Quickshell.execDetached(["sh", "-lc", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"])
        root.refreshState()
    }

    onWheelUp: {
        Quickshell.execDetached(["sh", "-lc", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"])
        root.refreshState()
    }

    onWheelDown: {
        Quickshell.execDetached(["sh", "-lc", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"])
        root.refreshState()
    }
}
