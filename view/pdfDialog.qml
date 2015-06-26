import QtQuick 2.2
import QtQuick.Dialogs 1.0

FileDialog {
    id: saveDialog
    title: "Please choose a file"
    nameFilters:["pdf files (*.pdf)"]
	
    selectExisting :false
    onAccepted:{
		var tab=tabview.getTab(tabview.currentIndex).item
	
		var text=tab.getText()
		con.getPdf(text,saveDialog.fileUrl)

	}
    
}