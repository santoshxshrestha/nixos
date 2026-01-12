import QtQuick
import Quickshell
import Quickshell.Wayland

import "./modules/bar/"
import "./services" as Services

ShellRoot {
    // Ensure singleton is instantiated and connects on startup.
    property var _niri: Services.Niri

    LazyLoader {
        active: true
        component: LeftBar {}
    }
}
