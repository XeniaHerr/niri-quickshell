import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.components.Icons
import qs.components.View
import qs.services
import "common/"




MonitorView {

    id: root

    level: CPU.formattedUsage >=  80 ? MonitorView.Level.Critical : CPU.formattedUsage >= 50 ? MonitorView.Level.Warn : MonitorView.Level.Normal
    RowLayout {
	id: layout
	spacing: 2



	CPUIcon { id: icon; color: root.finalColor}
	StyledText {
	    id: value
	    fixWidth: true
	    maxCharCount: 4
	    color: root.finalColor
	    
	    text: valuetoString(CPU.formattedUsage)}

    }
}
