import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
Dialog {

    width: 200
    height: 200
    standardButtons: StandardButton.Ok | StandardButton.Cancel

	
	Column{
		spacing: 8


		Row{

			spacing: 8
			Label { 
				id: label_account
				width:40
				text: qsTr("account")
			    }

			TextField {
				id: account
				
				
				placeholderText: qsTr("")
			    }
		
		}

    
		Row{

			spacing: 8
			Label {
				id: label_password
				width:40
				
				text: qsTr("password")
			    }

			TextField {
				id: password
				
				echoMode: TextInput.Password
				placeholderText: qsTr("")
			    }
		}


	

	}

	

    
	onAccepted: {
		
		con.setEmailAcount(account.text,password.text)
	
	}

}
