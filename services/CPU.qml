pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import qs.config
import "utils.js" as Utils

Singleton {

    id: cpuinfo

    property var prevStats: []

    property var coreUsages: []
    property real overallUsage: 0.0
    readonly property real formattedUsage: Math.round( overallUsage * 100)

    readonly property bool isCritical: formattedUsage > 75

    readonly property bool isHigh: formattedUsage > 50

    FileView {

	id: cpufile

	path: "/proc/stat"
	onLoadFailed: (error) => {
	    console.error("Failed to load /proc/stat:", error)}}

    Timer {
	interval: Config.data.settings.monitors.interval
	id: ramtimer
	running: true
	repeat: true
	triggeredOnStart: true
	onTriggered: Utils.cpuinfo() }

}
