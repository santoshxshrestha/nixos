import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property alias text: label.text
    property color normalColor: "#524f67"
    property color hoverColor: "#524f67"
    property color activeColor: "#524f67"
    property real normalOpacity: 0.20
    property real hoverOpacity: 0.30
    property real activeOpacity: 0.50

    property bool active: false

    signal leftClicked()
    signal rightClicked()
    signal wheelUp()
    signal wheelDown()

    radius: 6
    color: active ? activeColor : normalColor
    opacity: active ? activeOpacity : Math.max(normalOpacity, 0.45)

    implicitHeight: 28

    Text {
        id: label
        anchors.centerIn: parent
        color: root.active ? "#ffffff" : "#ffffff"
        font.family: "JetBrains Mono Nerd Font"
        font.pixelSize: 16
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onEntered: {
            if (!root.active) root.opacity = root.hoverOpacity
        }

        onExited: {
            if (!root.active) root.opacity = root.normalOpacity
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
