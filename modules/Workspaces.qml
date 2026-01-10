import QtQuick
import QtQuick.Layouts
import Quickshell
import QtQuick.Shapes
import "common/"
import qs.components.Animations
import qs.config



Rectangle {
    id: root
    anchors.left: parent.left
    anchors.leftMargin: -2
    anchors.top: parent.top
    anchors.verticalCenter: parent.verticalCenter
    //    color: "#22222222";
    color: "transparent"
    height: workspaces.implicitHeight
    
    width: workspaces.implicitWidth + 20
    LeftShape {
	RowLayout {
	    id: workspaces
	    anchors.leftMargin: 10
	    anchors.rightMargin: 100
	    anchors.centerIn: parent
	    spacing: 10
	    Layout.alignment: Qt.AlignHCenter
	    Repeater {
		model: niri.workspaces
	    	Rectangle {
		    visible: index < 11
		    width: 12 // model.isActive ? 25 : 12
		    //			scale: model.isActive ? 1.4 : 1
		    //			transformOrigin: Item.center
		    height: 12
		    radius: 8
		    color: model.isActive ? Config.data.appearance.colors.yellow : Config.data.appearance.colors.surfaceTwoColor
		    MouseArea {
			anchors.fill: parent
			cursorShape: Qt.PointingHandCursor
			onClicked: niri.focusWorkspaceById(model.id)
		    }
		    Behavior on width {
			NumberAnimation {
			    duration: 200
			}}
		    Behavior on scale {
			NumberAnimation {
			    duration: 200}}
		    Behavior on color {
			CAnim {} }
		}}
	}
    }
    
}
    

