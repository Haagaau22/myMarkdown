import QtQuick 2.2
import QtQuick.Dialogs 1.0

FileDialog {
	
    id:emailAttsDialog
    title: "Please choose a file"
    nameFilters:["markdown files (*.md)","All files (*)"]

    onAccepted: {
  
	att.insert(att.length,emailAttsDialog.fileUrls+"\n");
	
	
    }
    onRejected: {
        console.log("Canceled")
        //Qt.quit()
    }
    
}