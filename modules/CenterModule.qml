import QtQuick
import Quickshell
import QtQuick.Shapes

Shape  {

     property int maxWidth: 400

    property int targetheight: loader.item ? loader.item.implicitHeight : 28
    id: centerModule
    
    height: loader.item ? loader.item.implicitHeight : 28
    width: loader.item ? loader.item.implicitWidth + 25 : 0

//    visible: loader.item ? loader.item.visible : false

    ShapePath {
	fillColor: "#ff222222"
	strokeWidth: 0
	startX: 0
	startY: 0
	PathLine{x: 0; y: height - 10}
	PathLine {x: 10; y: height}
	PathLine {x: width -10 ; y: height}
	PathLine {x: width; y: height - 10}
	PathLine {x: width; y: 0}
//	PathLine {x:0; y:0}
    }

    ShapePath {
	fillColor: "transparent"
	strokeWidth: 2
	startX: 0
	startY: 0
	PathLine{x: 0; y: height - 10}
    	PathLine {x: 10; y: height}
	PathLine {x: width -10 ; y: height}
	PathLine {x: width; y: height - 10}
	PathLine {x: width; y: 0}
}
    anchors {
	horizontalCenter: parent.horizontalCenter


	top: parent.top
	leftMargin: 5
    }




    Behavior on width {
	NumberAnimation {
	    duration: 300
	    easing.type: Easing.Linear}
    }
    Behavior on height {
	NumberAnimation {
	    duration: 200}
    }

       Behavior on visible {
      NumberAnimation {
	  duration: 200}
      }

    Component {
	id: currentwindow
	CurrentWindow {}
}
    Component {
	id: notifications

	Rectangle {
	    implicitWidth: test.contentWidth
	    implicitHeight: test.contentHeight
	    color: "transparent"
	    MouseArea {
		anchors.fill: parent
		onClicked: loader.sourceComponent = components["focusedWindow"]
	    }
	    Text { id: test; text: "THis\n is\n a\n Test"}
	}
	}
    //}
//	Notification{}

    
    property var components: {
	"focusedWindow": currentwindow,
	"notification": notifications
	 }

    Notification {
	id: notifi
	visible: false}

    
    MouseArea {

	anchors.fill: parent
	onClicked: loader.sourceComponent = components["notification"]}

    Loader {
	id: loader
	active: true
	anchors.centerIn: parent
	sourceComponent: components["focusedWindow"] }
}














