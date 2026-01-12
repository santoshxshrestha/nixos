import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property alias text: label.text
    property color normalColor: "#524f67"
    property color hoverColor: "#524f67"
    property color activeColor: "#524f67"

    // Background opacity only (keeps text/icons bright).
    property real normalOpacity: 0.40
    property real hoverOpacity: 0.45
    property real activeOpacity: 0.70

    property bool active: false

    signal leftClicked()
    signal rightClicked()
    signal wheelUp()
    signal wheelDown()

    radius: 6
    color: "transparent"
    opacity: 1

    implicitHeight: 28

    property alias label: label

    Rectangle {
        id: bg
        anchors.fill: parent
        radius: root.radius
        color: root.active ? root.activeColor : root.normalColor
        opacity: root.active ? root.activeOpacity : root.normalOpacity
    }

    Text {
        id: label
        anchors.centerIn: parent
        color: "#f0f0f0"
        opacity: 1
        font.family: "JetBrains Mono Nerd Font"
        font.pixelSize: 18
        font.bold: root.active
        visible: label.text.length > 0
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onEntered: {
            if (!root.active) bg.opacity = root.hoverOpacity
        }

        onExited: {
            if (!root.active) bg.opacity = root.normalOpacity
        }

        onClicked: (mouse) => {
            if (mouse.button === Qt.LeftButton) root.leftClicked();
            if (mouse.button === Qt.RightButton) root.rightClicked();
        }

        onWheel: (wheel) => {
            if (wheel.angleDelta.y > 0) root.wheelUp();
            if (wheel.angleDelta.y < 0) root.wheelDown();
        }
    }
}
