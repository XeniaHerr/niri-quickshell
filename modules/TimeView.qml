import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services
import qs.components.Icons
import qs.config
import "common/"


//TODO: Make formating configurable
Item {
    id: root
    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    property string shortFormat: "hh:mm:ss"

    property string longFormat: "ddd dd - MM yyyy"

    RowLayout {
	spacing: 2
	id: layout

	ClockIcon {}
	    StyledText {
	id: clock
	property bool showlong: false
		text: Qt.formatDateTime( Time.rawdate, showlong ? longFormat : shortFormat)
		//showlong ? Time.datetime : Time.time


				MouseArea {
	    anchors.fill: parent
	    onClicked:  clock.showlong = !clock.showlong 
	}


		    }
	}
	}




