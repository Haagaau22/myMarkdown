import QtQuick 2.2
import QtQuick.Dialogs 1.0

FileDialog {
    
    title: "Please choose a file"
    nameFilters:["markdown files (*.md)","All files (*)"]

	
	id: openDialog
	onAccepted:{
		
		var text=con.openMd(openDialog.fileUrl);
		var name=con.getName(openDialog.fileUrl);
		
		var c = Qt.createComponent("Mytab.qml");
		tabview.addTab("tab", c);
		var last = tabview.count-1;
		var tab=tabview.getTab(last)
		tab.active = true;
		tab.item.setText(text);
		tab.item.setName(name);
		tab.title=tab.item.name;
	}
    
}