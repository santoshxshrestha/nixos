pragma Singleton

import QtQuick

// Global configuration and feature flags.
Item {
    // Kill switch: when true, the visualizer does no work.
    property bool disableVisualizer: true

    // When true, the active workspace icon does not spin.
    property bool disableWorkspaceSpin: false
}
