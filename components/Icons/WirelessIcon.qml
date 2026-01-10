import QtQuick
import QtQuick.Shapes
import qs.components.Animations

Item {

    id: root
    property string color: "#ff0000ff"
    property string backgroundcolor: "#88000000";

    property real scale: 24
    property int strength: 3

    width: scale
    height: scale
    Behavior on color {
	CAnim {}}

Shape {

    anchors.centerIn: parent
    width: root.width
    height: root.height
    preferredRendererType: Shape.CurveRenderer
    fillMode: Shape.PreserveAspectFit
    transformOrigin: Item.TopLeft

    ShapePath {

	fillColor: root.strength >= 3 ? root.color : root.backgroundcolor
	strokeColor: "transparent"
//	strokeWidth: 0
		PathSvg {
		    path:"M140,204a12,12,0,1,1-12-12A12,12,0,0,1,140,204ZM237.08,87A172,172,0,0,0,18.92,87,8,8,0,0,0,29.08,99.37a156,156,0,0,1,197.84,0A8,8,0,0,0,237.08,87ZM205,122.77a124,124,0,0,0-153.94,0A8,8,0,0,0,61,135.31a108,108,0,0,1,134.06,0,8,8,0,0,0,11.24-1.3A8,8,0,0,0,205,122.77Zm-32.26,35.76a76.05,76.05,0,0,0-89.42,0,8,8,0,0,0,9.42,12.94,60,60,0,0,1,70.58,0,8,8,0,1,0,9.42-12.94Z"


		}
      }
      ShapePath {

	  fillColor: root.strength >= 2 ? root.color : root.backgroundcolor
	strokeColor: "transparent"
//	strokeWidth: 0
		PathSvg {

    path: "M140,204a12,12,0,1,1-12-12A12,12,0,0,1,140,204Zm65-81.23a124,124,0,0,0-153.94,0A8,8,0,0,0,61,135.31a108,108,0,0,1,134.06,0,8,8,0,0,0,11.24-1.3A8,8,0,0,0,205,122.77Zm-32.26,35.76a76.05,76.05,0,0,0-89.42,0,8,8,0,0,0,9.42,12.94,60,60,0,0,1,70.58,0,8,8,0,1,0,9.42-12.94Z"

		}
      }


	    ShapePath {

		fillColor: root.strength >= 1 ? root.color  : root.backgroundcolor
	strokeColor: "transparent"
//	strokeWidth: 0
		PathSvg {
		    		path: "M140,204a12,12,0,1,1-12-12A12,12,0,0,1,140,204Zm32.71-45.47a76.05,76.05,0,0,0-89.42,0,8,8,0,0,0,9.42,12.94,60,60,0,0,1,70.58,0,8,8,0,1,0,9.42-12.94Z"


	}

	    }

    ShapePath {

	fillColor: root.color
	strokeColor: "transparent"
//	strokeWidth: 0
	PathSvg {
	    path: "M140,204a12,12,0,1,1-12-12A12,12,0,0,1,140,204Z"

}

    }
}

}

