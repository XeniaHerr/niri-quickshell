pragma Singleton


import Quickshell.Wayland
import Quickshell
import QtQuick


Singleton {


    id: root


    property bool enabled: false
    




    IdleInhibitor {

	enabled: root.enabled
	window: PanelWindow {
	    implicitWidth: 0
	    implicitHeight: 0
	    color: "transparent"
	    mask: Region {}
	    
	}
    }
}
