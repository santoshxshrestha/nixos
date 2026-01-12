pragma Singleton
import QtQuick

QtObject {
    id: root

    property var workspaces: []

    function focusWorkspaceById(_id) {
        // TODO: implement once Niri QML plugin is available.
    }
}
