import QtQuick
import QtQuick.Shapes
import qs.components.Animations
import qs.config
Item {

    id: root
    property string color: Config.data.appearance.colors.mauve
    property string backgroundcolor: Config.data.appearance.colors.surfaceTwoColor

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

	fillColor: root.strength >= 4 ? root.color : root.backgroundcolor
	strokeColor: "transparent"
//	strokeWidth: 0
		PathSvg {




		    path: "M200,56H32A24,24,0,0,0,8,80v96a24,24,0,0,0,24,24H200a24,24,0,0,0,24-24V80A24,24,0,0,0,200,56Zm8,120a8,8,0,0,1-8,8H32a8,8,0,0,1-8-8V80a8,8,0,0,1,8-8H200a8,8,0,0,1,8,8ZM184,96v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Zm-40,0v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Zm-40,0v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0ZM64,96v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Zm192,0v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Z"
		}
      }


    
    ShapePath {

	fillColor: root.strength >= 3 ? root.color : root.backgroundcolor
	strokeColor: "transparent"
//	strokeWidth: 0
		PathSvg {

		    path: "M200,56H32A24,24,0,0,0,8,80v96a24,24,0,0,0,24,24H200a24,24,0,0,0,24-24V80A24,24,0,0,0,200,56Zm8,120a8,8,0,0,1-8,8H32a8,8,0,0,1-8-8V80a8,8,0,0,1,8-8H200a8,8,0,0,1,8,8ZM144,96v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Zm-40,0v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0ZM64,96v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Zm192,0v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Z"

		}
      }
      ShapePath {

	  fillColor: root.strength >= 2 ? root.color : root.backgroundcolor
	strokeColor: "transparent"
//	strokeWidth: 0
		PathSvg {

		    path: "M200,56H32A24,24,0,0,0,8,80v96a24,24,0,0,0,24,24H200a24,24,0,0,0,24-24V80A24,24,0,0,0,200,56Zm8,120a8,8,0,0,1-8,8H32a8,8,0,0,1-8-8V80a8,8,0,0,1,8-8H200a8,8,0,0,1,8,8ZM104,96v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0ZM64,96v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Zm192,0v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Z"
		}
      }


	    ShapePath {

		fillColor: root.strength >= 1 ? root.color  : root.backgroundcolor
	strokeColor: "transparent"
//	strokeWidth: 0
		PathSvg {
		    	
		    path:"M200,56H32A24,24,0,0,0,8,80v96a24,24,0,0,0,24,24H200a24,24,0,0,0,24-24V80A24,24,0,0,0,200,56Zm8,120a8,8,0,0,1-8,8H32a8,8,0,0,1-8-8V80a8,8,0,0,1,8-8H200a8,8,0,0,1,8,8ZM64,96v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Zm192,0v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Z"

	}

	    }

    ShapePath {

	fillColor: root.color
	strokeColor: "transparent"
//	strokeWidth: 0
	PathSvg {

	    path: "M200,56H32A24,24,0,0,0,8,80v96a24,24,0,0,0,24,24H200a24,24,0,0,0,24-24V80A24,24,0,0,0,200,56Zm8,120a8,8,0,0,1-8,8H32a8,8,0,0,1-8-8V80a8,8,0,0,1,8-8H200a8,8,0,0,1,8,8Zm48-80v64a8,8,0,0,1-16,0V96a8,8,0,0,1,16,0Z"

}

    }
}

}

