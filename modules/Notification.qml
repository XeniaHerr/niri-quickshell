import Quickshell
import QtQuick
import QtQuick.Shapes

	PanelWindow {
	    visible: false
//	    anchor.window: bar
//	    anchor.rect.x: bar.width /2 - width /2
	    //	    anchor.rect.y: 0
	    anchors {
		top: true}
	    exclusionMode: ExclusionMode.Ignore
	    color: "transparent"

	    implicitWidth: centerModule.width;
	    id: notification
	    Shape  {


    //    visible: loader.item.visible

    visible: width === 0 ? false : true
    ShapePath {
	fillColor: "#ff222222"
	strokeWidth: 2
	startX: 0
	startY: 0
	PathLine {x: 10; y: height}
	PathLine {x: width -10; y: height}
	PathLine {x: width ; y: 0}
    }
		MouseArea {
		    visible: parent.visible
		    anchors.fill: parent
		    onClicked: {notification.visible = false;}
		}
//		    onClicked: centerModule.loader.sourceComponent = centerModule.components["focusedwindow"]}

		Text {text: "Under Construction\n This is a \n Test"}}}



