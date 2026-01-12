pragma Singleton

import Quickshell.Services.UPower
import QtQuick

QtObject {
    readonly property bool available: UPower.displayDevice?.isLaptopBattery ?? false
    readonly property int chargeState: UPower.displayDevice?.state ?? UPowerDeviceState.Unknown

    readonly property bool isCharging: chargeState === UPowerDeviceState.Charging
    readonly property bool isPluggedIn: isCharging || chargeState === UPowerDeviceState.PendingCharge

    // UPower percentage is 0..1 in Quickshell
    readonly property real percentage: UPower.displayDevice?.percentage ?? 0
}
