import Quickshell
import QtQuick

import qs.components.Icons
import qs.services




Item {
    id: root
    implicitHeight: icon.height
    implicitWidth: icon.width
    property bool enabled : false
    onEnabledChanged: IdleInhibitor.enabled = enabled
    IdleInhibitorIcon {
	id: icon
	opened: root.enabled
	color: root.enabled ? highlightcolor : defaultColor
	MouseArea {
	    anchors.fill: parent
	    onClicked: root.enabled = !root.enabled
	}
    }


    


}
