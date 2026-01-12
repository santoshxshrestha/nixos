pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root
    visible: false
    width: 0
    height: 0

    // Hardcoded for this system.
    property string batPath: "/sys/class/power_supply/BAT0"

    // 0..1 to match the old UPower service expectations.
    property real percentage: 0

    // Raw status string from sysfs: Charging/Discharging/Full/Not charging/Unknown
    property string status: "Unknown"

    readonly property bool available: true

    readonly property bool isCharging: root.status === "Charging"

    // Consider plugged when charging or when AC is connected but status is "Not charging".
    // We infer adapter plugged by reading ADP0 online.
    readonly property bool isPluggedIn: root.isCharging || (root.adapterOnline && (root.status === "Not charging" || root.status === "Full"))

    property bool adapterOnline: false

    property int intervalMs: 5000

    Timer {
        interval: root.intervalMs
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            capProc.running = true;
            statusProc.running = true;
            adapterProc.running = true;
        }
    }

    Process {
        id: capProc
        command: ["sh", "-lc", `cat ${root.batPath}/capacity 2>/dev/null || echo 0`]

        stdout: StdioCollector {
            onStreamFinished: {
                const out = parseInt((this.text ?? "0").trim(), 10);
                root.percentage = isNaN(out) ? 0 : (out / 100.0);
            }
        }
    }

    Process {
        id: statusProc
        command: ["sh", "-lc", `cat ${root.batPath}/status 2>/dev/null || echo Unknown`]

        stdout: StdioCollector {
            onStreamFinished: {
                root.status = (this.text ?? "Unknown").trim();
            }
        }
    }

    Process {
        id: adapterProc
        command: ["sh", "-lc", "cat /sys/class/power_supply/ADP0/online 2>/dev/null || echo 0"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.adapterOnline = ((this.text ?? "0").trim() === "1");
            }
        }
    }
}
