import QtQuick
import QtQuick.Shapes
import Quickshell




  Shape {
      id: root
      width: parent.width
      height: parent.height
      transformOrigin: Item.TopRight
      
	ShapePath {
	    strokeWidth: 0
	startX: 0
	    startY: 0
	    fillColor: "#ff222222"
	    PathLine {x: 0; y: height - 10}
	    PathLine {x: 10; y: height}
	    PathLine { x: width; y: height}
	    PathLine { x: width ; y: 0}
	    PathLine {x: 0; y: 0}

	}

	ShapePath {
	    strokeWidth: 1
	startX: 0
	    startY: 0
	    fillColor: "transparent"
	    PathLine {x: 0; y: height - 10}
	    PathLine {x: 10; y: height}
	    PathLine { x: width; y: height}
	    /* PathLine { x: width ; y: 0} */
	    /* PathLine {x: 0; y: 0} */

	}
      

      Behavior on width {
	  NumberAnimation {
	      duration: 200}
      }
      Behavior on visible {
      NumberAnimation {
	  duration: 200}
      }

  }
  

