import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3

ApplicationWindow{
		visible:true
		width:940
		height:680
		id:root
		title:"markdwon editor"
		


		

    Action {
        id: exitAction
        text: qsTr("Exit")
        onTriggered: Qt.quit()
    }


   Action {
        id: saveAction
        text: qsTr("save ")
        onTriggered:{
			
		saveMd()
		
		}
    }


   Action {
        id: saveAsAction
        text: qsTr("saveAs ")
        onTriggered:{
			saveAsLoader.item.open()
			
		}
    }


   Action {
        id: openAction
        text: qsTr("open ")
        onTriggered:{
			openLoader.item.open()
		}
    }



    Action {
        id: newAction
        text: qsTr("New")
        iconSource: "../resource/images/new.png"
        onTriggered: {
            
		var c = Qt.createComponent("Mytab.qml");
		tabview.addTab("tab", c);
		var last = tabview.count-1;
		var tab=tabview.getTab(last)
		tab.title="new File"
		tab.active = true;


		
        }
    }
    Action {
        id: cutAction
        text: qsTr("Cut")
        iconSource: "../resource/images/cut.png"
        onTriggered: tabview.getTab(tabview.currentIndex).item.doCut()
    }
    Action {
        id: copyAction
        text: qsTr("Copy")
        iconSource: "../resource/images/copy.png"
        onTriggered:{
		tabview.getTab(tabview.currentIndex).item.doCopy()

	}
    }


    Action {
        id: pasteAction
        text: qsTr("Paste")
        iconSource: "../resource/images/paste.png"
        onTriggered: tabview.getTab(tabview.currentIndex).item.doPaste()
    }

    Action {
        id: redoAction
        text: qsTr("redo")
        iconSource: "../resource/images/paste.png"
        onTriggered: tabview.getTab(tabview.currentIndex).item.doRedo()
    }

    Action {
        id: undoAction
        text: qsTr("undo")
        iconSource: "../resource/images/paste.png"
        onTriggered: tabview.getTab(tabview.currentIndex).item.doUndo()
    }

    Action {
        id: selectAllAction
        text: qsTr("selectAll")
        iconSource: "../resource/images/paste.png"
        onTriggered: tabview.getTab(tabview.currentIndex).item.doSelectAll()
    }

    Action {
        id: getPdfAction
        text: qsTr("getPdf")
        onTriggered:pdfLoader.item.open()
	
    }

    Action {
        id: sendEmailAction
        text: qsTr("sendEmail")
        onTriggered:pageLoader.item.open()
	
    }


    Action {
        id: emailSetttingAction
        text: qsTr("emailSetting")
        
        onTriggered: emailSettingLoader.item.open()
    }

    Action {
        id: closeAction
        text: qsTr("close")
        iconSource: "../resource/images/close.png"
        onTriggered: tabview.removeTab(tabview.currentIndex)
    }



    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action: newAction }
	    MenuItem { action: openAction }   
	    MenuItem { action: saveAction }
	    MenuItem { action: saveAsAction }
	    MenuSeparator {}
	    MenuItem { action: exitAction }
        }
        Menu {
            title: qsTr("&Edit")
            MenuItem { action: cutAction }
            MenuItem { action: copyAction }
            MenuItem { action: pasteAction }
	    MenuItem { action: redoAction }
	    MenuItem { action: undoAction }
            MenuSeparator {}
            MenuItem { action: selectAllAction }
        }
	
	 Menu {
            title: qsTr("&tools")
            MenuItem { action: getPdfAction }
	    MenuItem { action: sendEmailAction }
	    MenuItem { action: emailSetttingAction }
        }

    }

    toolBar: ToolBar {
        Row {
            anchors.fill: parent
            ToolButton { action: newAction }
            ToolButton { action: cutAction }
            ToolButton { action: copyAction }
            ToolButton { action: pasteAction }
	    ToolButton { action: closeAction }
        }
    }

 

 
	
	

	TabView{
	     id: tabview
	    anchors.fill: parent
	    anchors.margins: 4
	    

	    style: TabViewStyle {
		frameOverlap: 1
		tabsMovable : true
		tab: Rectangle {
		    color: styleData.selected ? "steelblue" :"lightsteelblue"
		    border.color:  "white"
		    implicitWidth: Math.max(text.width + 4, 80)
		    implicitHeight: 20
		    radius: 2
		    Text {
			id: text
			anchors.centerIn: parent
			text: styleData.title
			color: styleData.selected ? "white" : "black"
		    }

		    Image {
                        id: img
                        source: styleData.selected ?"../resource/images/delete.png":""
                        anchors.right: parent.right
                        anchors.rightMargin: -4
                        anchors.top: parent.top
                        anchors.topMargin: -4
			
			
			    MouseArea {
				anchors.fill: parent
				onClicked: { tabview.removeTab(tabview.currentIndex) }
			    }
                    }
		}
		frame: Rectangle { color: "white" }
    }
     

        }





	 Loader {
	 
		id:openLoader
		source:"openDialog.qml"
	 }


	 Loader { 
		id: pageLoader
		source : "email.qml"
		
	 }

	 Loader { 
		id: saveLoader
		source : "saveDialog.qml"
		
	 }
	

	 Loader { 
		id: pdfLoader
		source : "pdfDialog.qml"
		
	 }

	 Loader { 
		id: saveAsLoader
		source : "saveAsDialog.qml"
		
	 }

	 Loader { 
		id: emailSettingLoader
		source : "emailSetting.qml"
		
	 }


	function saveMd(){
		var tab=tabview.getTab(tabview.currentIndex).item;
			
			
			if(tab.getModify())
			{
				
				if(tab.getPath())
				{
					con.saveMd(tab.getText(),tab.getPath());
					tab.noModify();
				}
				else
				{
					saveLoader.item.open()		
					
				}

				
			}
	
	}

}



