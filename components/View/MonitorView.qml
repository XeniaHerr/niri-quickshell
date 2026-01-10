import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.components.Icons
import qs.services
import qs.config




Item {
    id: root

    enum Level {
	Normal = 0, Warn = 1, Critical = 2}
    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight
    property string criticalColor: Config.data.appearance.colors.criticalColor
    property string defaultColor: Config.data.appearance.colors.foregroundColor
    property string warnColor: Config.data.appearance.colors.warnColor
    property int level : Level.Normal

    
    property  string finalColor: level === 0 ? defaultColor : level === 1 ? warnColor : criticalColor

    
}


