pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import qs.config
import "utils.js" as Utils

Singleton {

    id: ram



     property real totalMem: 0
     property real availableMem: 0
    readonly property real percentUsed: Math.round((( totalMem - availableMem ) / totalMem) * 100)


    property real freeMem: 0
    readonly property string formatedPercentUsed: Utils.formatSize(freeMem)


    FileView {

	id: memfile
	path: "/proc/meminfo"

	onLoadFailed: (error) => {
	    console.error("Error opening /proc/meminfo:", error)}
    }

    Timer {
	interval: Config.data.settings.monitors.interval
	id: ramtimer
	running: true
	repeat: true
	triggeredOnStart: true
	onTriggered: Utils.raminfo() }
    
}
