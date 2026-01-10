import QtQuick
import Quickshell.Io


JsonObject {

    id: colors
    function rgbtoARGB(r,g,b, alpha = "ff") {
	return "#" + alpha + r + g + b;}
    property JsonObject font: JsonObject {

	property string family: "mononoki"

    }
// Use colors from Catppuccin Mocha
    property JsonObject colors: JsonObject {
	property string backgroundcolor: "#222222"
	property string bordercolor: "#ffffff"

	//Text
	property string foregroundColor: "#cdd6f4"
	//Yellow
	property string warnColor: "#f9e2af"
	//Red
	property string criticalColor: "#f38ba8"

	property string surfaceOneColor: "#45475a"
	property string surfaceTwoColor: "#585b70"
	property string mauve: "#cba6f7"
	property string yellow: "#f9e2af"
	property string blue: "#89b4fa"
	

//	property string warnColor: ""
    }
}
