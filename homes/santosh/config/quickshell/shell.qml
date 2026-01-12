import QtQuick
import Quickshell
import Quickshell.Wayland

import "./modules/bar/"

ShellRoot {
    LazyLoader {
        active: true
        component: LeftBar {}
    }
}
