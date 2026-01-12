//@ pragma UseQApplication
import QtQuick
import Quickshell
import Quickshell.Wayland

import "./modules/bar/"
import "./services" as Services

ShellRoot {
    // Ensure singletons are instantiated on startup.
    property var _niri: Services.Niri
    property var _battery: Services.Battery
    property var _network: Services.Network

    LazyLoader {
        active: true
        component: LeftBar {}
    }
}
