pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "Settings/"


Singleton {
    id:root

    property var data: adapter
    FileView {

	id: file
	path: Quickshell.shellDir + "/config.json"
	onAdapterUpdated: writeAdapter()
	onFileChanged: reload()
	blockLoading: true
	watchChanges: true
	JsonAdapter {
	    id: adapter

	    

	    property Appearance appearance: Appearance {}

	    property Settings settings: Settings {}

	    
	}

    }

}
