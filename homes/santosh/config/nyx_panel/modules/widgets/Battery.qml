import QtQuick

import "../../services" as Services

WidgetButton {
    id: root

    // Render as a single centered glyph so it always fits.

    property int pct: Math.round(Services.BatterySys.percentage * 100)

    property string batteryGlyph: {
        // Match the Waybar config icons you use (10-level Nerd Font set).
        if (Services.BatterySys.isCharging) return "\udb85\udc0b"; // charging
        if (Services.BatterySys.isPluggedIn) return "\udb85\udfe2"; // plugged

        if (pct <= 10) return "\udb80\udc7a";
        if (pct <= 20) return "\udb80\udc7b";
        if (pct <= 30) return "\udb80\udc7c";
        if (pct <= 40) return "\udb80\udc7d";
        if (pct <= 50) return "\udb80\udc7e";
        if (pct <= 60) return "\udb80\udc7f";
        if (pct <= 70) return "\udb80\udc80";
        if (pct <= 80) return "\udb80\udc81";
        if (pct <= 90) return "\udb80\udc82";
        return "\udb80\udc79";
    }

    label.font.pixelSize: 18
    label.elide: Text.ElideRight

    // Match Waybar-ish battery colors (charging > low battery).
    label.color: {
        if (!Services.BatterySys.available) return "#f0f0f0";
        if (Services.BatterySys.isCharging) return "#66ff66";
        if (pct <= 20) return "#ff6666";
        if (pct <= 30) return "#ffcc66";
        return "#f0f0f0";
    }

    // Keep layout stable even if font differs.
    implicitWidth: implicitHeight
    implicitHeight: label.font.pixelSize * 2 + 8

    Column {
        anchors {
            fill: parent
            leftMargin: root.paddingX
            rightMargin: root.paddingX
            topMargin: root.paddingTop
            bottomMargin: root.paddingBottom
        }
        spacing: 2

        Text {
            text: Services.BatterySys.available ? batteryGlyph : "\udb80\udc79"
            color: root.label.color
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize:root.label.font.pixelSize
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        // // seperator between time and date
        // Rectangle {
        //     width: parent.width
        //     height: 3
        //     color: "#ffffff"
        //     opacity: 0.25
        // }

        Text {
            text: Services.BatterySys.available ? `${pct}%` : "N/A"
            color: root.label.color
            font.family: "JetBrains Mono Nerd Font"
            font.pixelSize: 10
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
    }

    // Tooltip-style info without cramming text into the button.
    // Quick and portable: just use the button's `toolTip` if available.
    // (If your Quickshell build doesn’t expose it, this is ignored.)
    property string toolTip: Services.BatterySys.available ? `${pct}%` : "Battery"
}
