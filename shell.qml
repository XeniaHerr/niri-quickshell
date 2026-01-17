import Quickshell
import QtQuick
import QtQuick.Layouts
import Niri 0.1
import "modules/"
import qs.modules.common


ShellRoot {

    id: root
    Niri {
	id: niri
	Component.onCompleted: connect()
	onConnected: console.info("Connected to niri")
	onErrorOccurred: function(error) {
	    console.error("Niri error:", error)}}

    Variants {
	model: Quickshell.screens.filter(s => s.model == "VG270U P" || s.name == "eDP-1");
    
	delegate: Component {

	    Item {

		    required property var modelData


		LazyLoader {active: true;   component: LeftBar{ screen: modelData}}
		LazyLoader{ active: true;    component: CenterBar{ screen: modelData }}
		LazyLoader{ active: true;   component: RightBar{screen: modelData }}
	    }
	}
    }
	

    LazyLoader {active: false; component: PanelWindow {
		id: testing
	    property int barWidth: width
    anchors {
	right: true
//	top: true
    }

    implicitHeight: 28
//    implicitWidth: shape.targetwidth
//    onWidthChanged: console.log("Width", width, "x", x)
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
	implicitWidth: 25 + 204
	onWidthChanged: console.log("Implicit width of WIndow:", implicitWidth)

//	onWidthChanged: console.log("New X", x )

	RightShape {
		id: shape
		Behavior on x {
		    NumberAnimation {
			duration: 200
						}
		}
	    onXChanged: console.log("X:", x)
		implicitWidth: targetWidth
	    property int targetWidth: myTest.implicitWidth + 15
	    property int oldWidth: 0
	    property int targetX: 0
	    x: testing.implicitWidth - targetWidth
	    onTargetXChanged: console.log("TargetX", targetX)
	    onTargetWidthChanged:{ console.log("Target Width", targetWidth);
				   console.log("oldWidth", oldWidth)
			//	   shape.x = targetWidth -  oldWidth
				   console.log("I hate X", shape.x)

				   oldWidth = targetWidth;
				 }

		anchors {
		    rightMargin: 0
//		    left: parent.left

		}

		Text {
		    id: myTest
		    property bool myToggle: true
		    text: myToggle ? "short text" : "not quite a short text you see,  "
		    MouseArea {
			anchors.fill: parent
			onClicked: myTest.myToggle = !myTest.myToggle}}

    }}



	       }
}
