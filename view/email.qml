import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
Dialog {

    width: 400
    height: 400
    standardButtons: StandardButton.Ok | StandardButton.Cancel

	
	Column{
		spacing: 8


		


		Row{
			spacing: 8
			Label {
				id: label_receiver
				width:60
				
				text: qsTr("receiver")
			    }

			TextArea {
				id: receiver
				
			    }
		}


		Row{
			spacing: 8
			Label {
				id: label_subject
				width:60
				text: qsTr("subject")
			    }
			    
			TextField {
				id: subject
				
				
				placeholderText: qsTr("")
			    }
		
		}

		Row{
			spacing: 8
			 Label {
				id: label_content
				width:60
				text: qsTr("content")
			    }

			 TextArea {
				id: content
				
			    }

	
		}

		Row{
			spacing: 8
			 Label {
				id: label_att
				width:60
				text: qsTr("atts")
			    }

			 TextArea {
				id: att
				
				
			    }

			
	
		}
		Button{
			id :addAtts
			text:"addAtts"
			height:30
			width:50
			
			onClicked:attLoader.item.open()
			
		}
		

	}

	
	

	

	
	Loader{
		id:attLoader
		source:"emailAttsDialog.qml"
	
		
	}
    
	onAccepted: {
		
		con.sendMail(receiver.text,content.text,subject.text,att.text)
	
	}

}
