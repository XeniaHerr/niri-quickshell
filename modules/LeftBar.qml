import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: leftBar
    property int barWidth: width
    anchors {
	top: true
	left: true
	right: true
    }
    color: "transparent"
    exclusionMode: ExclusionMode.Normal
    exclusiveZone: 25
//    implicitHeight: 28
    height: 28
        Workspaces{}
//    Info {}

}

