import QtQuick
import QtQuick.Shapes
import qs.config



  Shape {
      id: root
      width: parent.width
      height: parent.height
	ShapePath {
	    strokeWidth: 2
	startX: 0
	    startY: 0
	    //	fillColor: "#ff222222"
	    fillColor: Config.data.appearance.colors.backgroundcolor
	    PathLine {x: 0 ; y: root.height}
	    PathLine { x: root.width - 10 ; y: root.height}
	    PathLine {x: root.width ; y: height - 10}
	    	    PathLine {x: root.width  ; y: 0}
	}

      Behavior on width {
	  NumberAnimation {
	      duration: 200
	      }
      }

      
      Behavior on visible {
      NumberAnimation {
	  duration: 200}
      }



  }
  
