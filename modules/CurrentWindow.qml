import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config



Item {
    implicitWidth: Math.min(content.implicitWidth, 600)
    implicitHeight: visible ?  28 :  -10 //content.implicitHeight
    visible: niri.focusedWindow ? true : false

    Text {
	id: content
	text: niri.focusedWindow?.title ?? ""
	font.pixelSize: 16
	font.bold: true
	anchors.centerIn: parent
	elide: Text.ElideRight
	color: Config.data.appearance.colors.foregroundColor
	width: parent.width

    }
}


