import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtWebKit 3.0

Rectangle{
	id:tab
	width:parent.width
	height:parent.height
	property string name: "new file"



    Row {
        id: row
        anchors.fill: parent
        spacing: 8
        
	Rectangle{
		width:parent.width/2
		height:parent.height

		
		
		TextArea {
			id: textArea
			text:""
			wrapMode: TextEdit.Wrap
			font.pointSize: 16
			anchors.fill: parent
			
			property bool isModify:false
			property string path:""

			style: TextAreaStyle {
				textColor: "#333"
				selectionColor: "steelblue"
				selectedTextColor: "#eee"
				backgroundColor: "#eee"
			}
			onTextChanged: {
				web.loadHtml(con.toHtml(text),"","")
				modify()
			}





			Keys.onPressed: {
			if(event.modifiers == Qt.ControlModifier && event.key === Qt.Key_S) {
			    
			    
				root.saveMd()
				event.accepted = true;
			    
			    
			}
		    }

		}

	}




	ScrollView {
	    width:parent.width/2
	    height:parent.height
	    WebView {
		id: web
		
		anchors.fill: parent
		
		}
	}
	

    }



    	function doCopy()
	{
		textArea.copy();
	}

	
	function doCut()
	{
		textArea.cut();
	}

	function doPaste()
	{
		textArea.paste();
	}

	function getText()
	{
		return textArea.text;
	}

	function doRedo()
	{
		return textArea.redo();
	}

	function doUndo()
	{
		return textArea.undo();
	}

	function doSelectAll()
	{
		return textArea.selectAll();
	}

	function setText(content)
	{
		
		textArea.insert(0,content);
	}


	function modify()
	 {
		textArea.isModify=true;
	 }

	 function noModify()
	 {
		textArea.isModify=false;
	 }	


	function getModify()
	{
		return textArea.isModify;
	}


	function getPath(){
		return textArea.path;
	}

	function setPath(text)
	{
		
		textArea.path=text;
		
	}

	function setName(text)
	{
		tab.name=text;
	
	}

	function getName()
	{
		
		return tab.name;
	}

}