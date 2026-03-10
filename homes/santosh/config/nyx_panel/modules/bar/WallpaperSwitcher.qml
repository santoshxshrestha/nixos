import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

import "../../services" as Services

PanelWindow {
    id: panel

    // Show/hide based on the Wallpaper service state.
    visible: Services.Wallpaper.panelVisible

    anchors {
        left: true
        top: true
        bottom: true
    }

    // Offset from left edge to sit next to the 40px bar.
    margins.left: 44

    implicitWidth: 320
    color: "transparent"

    exclusionMode: ExclusionMode.Ignore
    focusable: true

    // IPC handler so niri keybind can toggle this panel.
    IpcHandler {
        target: "wallpaper"
        enabled: true

        function toggle(): void {
            Services.Wallpaper.toggle();
        }

        function show(): void {
            Services.Wallpaper.show();
        }

        function hide(): void {
            Services.Wallpaper.hide();
        }
    }

    // Keyboard handling for j/k navigation, Enter to apply, Escape to close.
    Item {
        id: keyHandler
        focus: panel.visible

        Keys.onPressed: function(event) {
            if (event.key === Qt.Key_J) {
                Services.Wallpaper.selectNext();
                ensureVisible();
                event.accepted = true;
            } else if (event.key === Qt.Key_K) {
                Services.Wallpaper.selectPrev();
                ensureVisible();
                event.accepted = true;
            } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                Services.Wallpaper.applySelected();
                event.accepted = true;
            } else if (event.key === Qt.Key_Escape) {
                Services.Wallpaper.hide();
                event.accepted = true;
            }
        }

        function ensureVisible(): void {
            const idx = Services.Wallpaper.selectedIndex;
            const itemHeight = 116; // 110 + 6 spacing
            const itemTop = idx * itemHeight;
            const itemBottom = itemTop + 110;
            const viewTop = flickable.contentY;
            const viewBottom = viewTop + flickable.height;

            if (itemBottom > viewBottom) {
                flickable.contentY = itemBottom - flickable.height;
            } else if (itemTop < viewTop) {
                flickable.contentY = itemTop;
            }
        }
    }

    // Re-focus when panel becomes visible.
    Connections {
        target: Services.Wallpaper
        function onPanelVisibleChanged(): void {
            if (Services.Wallpaper.panelVisible) {
                keyHandler.forceActiveFocus();
            }
        }
    }

    // Background panel — only covers the left 220px.
    Rectangle {
        id: background
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 220

        color: "#000000"
        opacity: 0.85
        radius: 8

        border.width: 1
        border.color: "#606060"
    }

    // Content area — 220px wide with margins, but allows overflow to the right.
    Item {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.leftMargin: 8
        anchors.topMargin: 8
        anchors.bottomMargin: 8

        ColumnLayout {
            anchors.fill: parent
            spacing: 8

            // Header
            Text {
                Layout.preferredWidth: 204
                text: "Wallpapers"
                color: "#f0f0f0"
                font.family: "JetBrains Mono Nerd Font"
                font.pixelSize: 13
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }

            // Separator line
            Rectangle {
                Layout.preferredWidth: 204
                Layout.preferredHeight: 1
                color: "#606060"
            }

            // Scrollable wallpaper list — clips vertically, allows horizontal overflow.
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true

                Flickable {
                    id: flickable
                    anchors.fill: parent
                    contentHeight: wallpaperColumn.implicitHeight
                    clip: false
                    boundsBehavior: Flickable.StopAtBounds

                    ColumnLayout {
                        id: wallpaperColumn
                        width: 204
                        spacing: 6

                        Repeater {
                            model: Services.Wallpaper.wallpapers

                            Item {
                                Layout.preferredWidth: 204
                                Layout.preferredHeight: 110

                                Rectangle {
                                    id: wallpaperItem
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    width: isSelected ? 260 : 204

                                    readonly property string filePath: modelData
                                    readonly property bool isCurrent: filePath === Services.Wallpaper.currentWallpaper
                                    readonly property bool isSelected: index === Services.Wallpaper.selectedIndex

                                    radius: 6
                                    color: "transparent"

                                    border.width: isSelected ? 1 : 0
                                    border.color: "#606060"

                                    Behavior on width {
                                        NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
                                    }

                                    // Clipped thumbnail container
                                    Rectangle {
                                        anchors.fill: parent
                                        anchors.margins: 2
                                        radius: 4
                                        clip: true
                                        color: "#1e1e2e"

                                        Image {
                                            anchors.fill: parent
                                            source: "file://" + wallpaperItem.filePath
                                            fillMode: Image.PreserveAspectCrop
                                            asynchronous: true
                                            sourceSize.width: 300
                                            sourceSize.height: 110
                                            cache: true
                                        }
                                    }

                                    // Filename label at bottom
                                    Rectangle {
                                        anchors.bottom: parent.bottom
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.margins: 2
                                        height: 20
                                        color: "#80000000"
                                        radius: 4

                                        Text {
                                            anchors.centerIn: parent
                                            text: {
                                                const parts = wallpaperItem.filePath.split("/");
                                                const name = parts[parts.length - 1];
                                                const base = name.replace(/\.[^.]+$/, "");
                                                return base.length > 28 ? base.substring(0, 25) + "..." : base;
                                            }
                                            color: "#f0f0f0"
                                            font.family: "JetBrains Mono Nerd Font"
                                            font.pixelSize: 9
                                        }
                                    }

                                    // Hover and click interaction
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        cursorShape: Qt.PointingHandCursor

                                        onClicked: {
                                            Services.Wallpaper.selectedIndex = index;
                                            Services.Wallpaper.setWallpaper(wallpaperItem.filePath);
                                        }
                                    }

                                    // Current wallpaper indicator icon
                                    Text {
                                        visible: wallpaperItem.isCurrent
                                        anchors.top: parent.top
                                        anchors.right: parent.right
                                        anchors.margins: 6
                                        text: "󰄬"
                                        color: "#a6e3a1"
                                        font.family: "JetBrains Mono Nerd Font"
                                        font.pixelSize: 14
                                        font.bold: true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
