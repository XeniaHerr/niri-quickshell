import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.components.Icons
import qs.services
import "common/"
import qs.config



Item {
    id: root

    property bool isBlinking: false
    property real percentage: Math.round(Battery.percentage * 100)
    property string level: "medium"/*    { */
    property string color: Config.data.appearance.colors.foregroundColor

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    property var icons: { "empty": emptyIcon, "low": lowIcon, "medium":  mediumIcon , "high": hightIcon, "full": fullIcon, "charging": chargingIcon }
    
    Component {
	id: fullIcon
	BatteryIcon { strength: 4
		      color: root.color}}

    Component {
	id: hightIcon
	BatteryIcon { strength: 3
		      color: root.color}}
    
    Component {
	id: mediumIcon
	BatteryIcon {strength: 2}}

    Component {
	id: lowIcon
	BatteryIcon {strength: 1}}
    Component {
	id: emptyIcon
	BatteryIcon {strength: 0
		     color: Config.data.appearance.colors.warnColor}}
    
    Component {
	id: chargingIcon
	
	BatteryCharging {color: Config.data.appearance.colors.yellow}}
    
    
    
    onPercentageChanged: getState()

    function getState() {
	//console.log(percentage)
	
	if (Battery.isCharging || Battery.isCritical)
	    return;
	
	//	let percentage = Battery.percentage;
	
	if (percentage >= 90)
	    level = "full"
	else if (percentage >= 75)
	    level = "high"
	else if (percentage >= 40)
	    level = "medium"
	else
	    level = "low"
	
	console.log(level)
	
    }
    
    
    
    
    
    
    RowLayout {
	id: layout
	spacing: 4
	
	
	
	Loader {
	    id: loader
	    active: true
	    sourceComponent: icons[level]}
	
	StyledText {
	    id: label
	    opacity: 1.0
	    color: loader.item.color
	    text: root.percentage + "%"}
    }
    
    
    SequentialAnimation {
	id: blink
	running: root.isBlinking
	loops: Animation.Infinite
	
	ParallelAnimation {
	    PropertyAnimation { target: label; property: "opacity"; from: 1.0; to: 0; duration: 800}
	    PropertyAnimation { target: loader.item; property: "opacity"; from: 1.0; to: 0; duration: 800}
	}
	ParallelAnimation {
	    PropertyAnimation { target: label; property: "opacity"; from: 0; to: 1.0; duration: 800}
	    PropertyAnimation { target: loader.item; property: "opacity"; from: 0; to: 1.0; duration: 800}
	}
	onStopped: {label.opacity = 1.0}
	
    }
    
    states: [
	State {
	    name: "critical"
	    when: Battery.isCritical
	    PropertyChanges { target: loader;
			      sourceComponent: root.icons["empty"]}
	    PropertyChanges {
		target: root
		isBlinking: true}

	}, 
	State {
	    name: "charging"
	    when: Battery.isCharging
	    PropertyChanges { target: loader; sourceComponent: root.icons["charging"]}}
    ]
    
}






