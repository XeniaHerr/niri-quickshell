pragma Singleton

import QtQuick
import Quickshell


Singleton {

    id: root

    readonly property string time: {
	Qt.formatDateTime(device.date, "hh:mm:ss")
    }

    readonly property string datetime: {
	Qt.formatDateTime(device.date, "ddd dd - MM yyyy")}

    readonly property alias rawdate: device.date

    SystemClock {
	id: device
	precision: SystemClock.Seconds}
}
