import QtQuick
import QtQuick.Layouts
import "common/"
Rectangle {
	id: root

   anchors.right: parent.right
    anchors.rightMargin: -2
   anchors.top: parent.top
    anchors.verticalCenter: parent.verticalCenter

    color: "transparent"
    height: content.implicitHeight
    
    width: content.implicitWidth + 25
	RightShape {
	    anchors.fill: parent
		RowLayout {
		    onWidthChanged: console.log(width)
		    anchors.centerIn: parent
		    /* anchors.leftMargin: 10 */
		    /* anchors.rightMargin: 10 */
		    id: content
		    spacing: 10
		    Layout.alignment: Qt.AlignHCenter
		    
		    Text {

			text: Battery.isBattery + Battery.percentage
				font {
	    bold: true
	    pixelSize: 14}

			
		    }
		    

    Text {
	id: clock
	property bool showlong: true
	text:  showlong ? Time.datetime : Time.time
	width: text.implicitWidth

	font {
	    bold: true
	    pixelSize: 14}

				MouseArea {
	    anchors.fill: parent
	    onClicked:  clock.showlong = !clock.showlong 
	}


		    }
	}
	}
	}
