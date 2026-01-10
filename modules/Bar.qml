import Quickshell
import Quickshell.Io
import QtQuick
import "common/"


PanelWindow {
    id: bar
anchors {
top: true
left: true
    right: true


}
//    clip: false
    implicitHeight: 28
    color: "transparent"

    Rectangle {
	anchors.fill: parent
	color: "transparent"

    Workspaces {}


	
	CenterModule { }
	


	Rectangle {
	    width: clock.implicitWidth + 25
	    height: clock.implicitHeight
	    color: "transparent"
	    anchors {
		right: parent.right
		top: parent.top
		rightMargin: -1
		verticalCenter: parent.verticalCenter
		
	    }
	    RightShape {

		Item {
		    anchors.fill: parent
//		    anchors.rightMargin: 6

		    SystemClock {
			id: clockdevice
			precision: SystemClock.Seconds}
    Text {
	id: clock
//	anchors.right: parent.right
//	anchors.verticalCenter: parent.verticalCenter
	anchors.centerIn: parent
	text: Qt.formatDateTime(clockdevice.date, "hh:mm:ss")
	font {
	    bold: true
	    pixelSize: 14}

	


    }
		}
	}
	}}}








