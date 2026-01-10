import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.components.Icons
import qs.components.View
import qs.services
import "common/"




MonitorView {
    id: root
    level: RAM.percentUsed >= 80 ? MonitorView.Level.Critical : RAM.percentUsed >= 40 ? MonitorView.Level.Warn : MonitorView.Level.Normal

        RowLayout {

	id: layout
	spacing: 2

	    RamIcon { color: root.finalColor}


	StyledText {
	    color: root.finalColor

	    fixWidth: true
	    maxCharCount: 4
	    text: RAM.percentUsed + "%"
	}
    }

}




