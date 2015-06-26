import QtQuick 2.2
import QtQuick.Dialogs 1.0

FileDialog {
    id: saveDialog
    title: "Please choose a file"
    nameFilters:["markdown files (*.md)","All files (*)"]
	
    selectExisting :false
    onAccepted:{
		var tab=tabview.getTab(tabview.currentIndex)
	
		var text=tab.item.getText()
		var name=con.saveMd(text,saveDialog.fileUrl)
		
		if(tab.item.getPath()=="")
		{
			tab.item.setPath(saveDialog.fileUrl);
		}

		tab.item.noModify();
		tab.item.setName(name);
		tab.title=tab.item.name;
		
	}

	
	onRejected: {
		
		//Qt.quit()
	}
    
}