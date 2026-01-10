import QtQuick
import QtQuick.Controls



Text {
    id: root
    property string criticalColor: "#ffff0000"
    property string defaultColor: "#ff000000"
    property string warnColor: "#ffffffff"
    property int level : 0
    property bool fixWidth : false
    property int maxCharCount: 0

    function valuetoString(value) {

	const widthofZero = metrics.advanceWidth("0")

	if (value == 100)
	    return value + "%"
	else if (value > 10)
	    return " " + value + "%"
	else return "  " + value + "%"
    }

//    onLevelChanged: console.log(level)
    font {
	bold: true
	pixelSize: 14
    }

    horizontalAlignment: Text.AlignRight
    color: level === 0 ? defaultColor : level === 1 ? warnColor : criticalColor

    width: !fixWidth ? contentWidth : metrics.advanceWidth * maxCharCount


    /* Component.onCompleted: { */
    /* 	sconsole.log("FixWidth =", fixWidth, ",calculatedwidth =", metrics.advanceWidth(" ".repeat(maxCharCount )) * 3, "width =", width) */
    /* 	//	width = !fixWidth ? contentWidth : metrics.maximumCharacterWidth * maxCharCount */
    /* 	width = !fixWidth ? contentWidth : metrics.advanceWidth(" ".repeat(maxCharCount + 1) * 3) */
    /* } */


    FontMetrics {
	id: metrics
	font: root.font
	}
}
    
