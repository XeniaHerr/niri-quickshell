import QtQuick
import Quickshell



PanelWindow {




    anchors {
	top: true
	/* left: true */
	/* right: true */
    }

//      width: screen.width  -  rightBar.width - leftBar.width
    width: 1000
        implicitHeight: Math.max(28, centerModule.targetheight)
//    height: centerModule.targetheight

    /* onWidthChanged: { console.log(width, height)} */
    /* onHeightChanged: {console.log(height, centerModule.targetheight)} */

   exclusionMode: ExclusionMode.Ignore
    color:"transparent"
//    implicitHeight: centerModule.height

    visible: centerModule.visible
    CenterModule {id: centerModule}
}
