import QtQuick
import QtQuick.Shapes
import qs.components.Animations

Item {

    id: root
    property string color: "#ff000000"

    property real scale: 24

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
	fillColor: root.color
	strokeColor: "transparent"
	
	PathSvg {

	    path: "M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24Zm0,192a88,88,0,1,1,88-88A88.1,88.1,0,0,1,128,216Zm64-88a8,8,0,0,1-8,8H128a8,8,0,0,1-8-8V72a8,8,0,0,1,16,0v48h48A8,8,0,0,1,192,128Z"

	}

	
    }
}
}

