import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "common/"
import qs.services
import qs.components.Icons

PanelWindow {

    id: rightBar
    property int barWidth: width
    anchors {
	right: true
	top: true
    }

    implicitHeight: 28
    implicitWidth: screen.width / 2 - 300 + 25
//    implicitWidth: shape.targetwidth
//    onWidthChanged: console.log("Width", width, "x", x)
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
//    implicitWidth: content.width + 25


	    RightShape {
		id: shape

		Behavior on x {
		    NumberAnimation {
			duration: 200
			easing.type: Easing.Linear}}
		
		property int targetwidth: content.implicitWidth + 15
//		implicitWidth: content.implicitWidth
		x: rightBar.width - targetwidth
//		width: content.width + 15
		anchors {
		    rightMargin: 0
//		    fill: content
		}

		Item {
		    id: helper
		    anchors {
			fill: parent
			leftMargin: 15
			rightMargin: 5
		    }

		    RowLayout {

		    StyledText {id: testing
				fixWidth: true
				maxCharCount: 4
				clip: true

				text: ""}

			

	Behavior on width {
	    NumberAnimation {
		duration: 150}}

		    id: content
		    spacing: 8

		    BatteryView {}
		    
		    CpuView {}

		    RamView {}

			IdleInhibitorView {}

			TimeView {}
		    
		    

	}
}


	    }
}






