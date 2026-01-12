pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root
    visible: false
    width: 0
    height: 0

    // Minimal NetworkManager reader via `nmcli`.
    // Avoids needing a dedicated Quickshell NM service.

    property bool connected: false
    // "wifi", "ethernet", or "unknown"
    property string primaryType: "unknown"

    property int intervalMs: 5000


    Timer {
        interval: root.intervalMs
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: connectivityProcess.running = true
    }

    Process {
        id: connectivityProcess
        command: ["sh", "-lc", "nmcli -t -f CONNECTIVITY general 2>/dev/null || echo none"]

        stdout: StdioCollector {
            onStreamFinished: {
                const out = (this.text ?? "").trim();
                root.connected = out !== "none" && out !== "limited" && out !== "portal" && out.length > 0;
                typeProcess.running = true;
            }
        }

        stderr: StdioCollector {
            onStreamFinished: {
                // Ignore errors; keep current state.
            }
        }
    }

    Process {
        id: typeProcess
        // Find the first connected device type.
        command: [
            "sh",
            "-lc",
            "nmcli -t -f TYPE,STATE dev 2>/dev/null | awk -F: '$2==\"connected\"{print $1; exit}'",
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                const out = (this.text ?? "").trim();
                root.primaryType = out.length > 0 ? out : "unknown";
            }
        }

        stderr: StdioCollector {
            onStreamFinished: {
                // Ignore errors; keep current type.
            }
        }
    }
}
