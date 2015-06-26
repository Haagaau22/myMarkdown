import QtQuick 2.2
import QtQuick.Dialogs 1.0

FileDialog {
    id: saveDialog
    title: "Please choose a file"
    nameFilters:["markdown files (*.md)","All files (*)"]
	
    selectExisting :false
    onAccepted:{
		var tab=tabview.getTab(tabview.currentIndex).item
	
		var text=tab.getText()
		con.saveMd(text,saveDialog.fileUrl)
		if(tab.getPath()=="")
		{
			tab.setPath(saveDialog.fileUrl);
		}
	}

	
	onRejected: {
		
		//Qt.quit()
	}
    
}