import sys
from PyQt5.QtGui import *
from PyQt5.QtNetwork import *
from PyQt5.QtCore import *
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import *
import htmlModel
import pdfModel
import fileModel
import emailModel

class MyClass(QObject):
    changeText=pyqtSignal()
    
    def __init__(self):
        super().__init__()
        self.name="hello"
        
        
    @pyqtSlot(str,result=str)
    def getName(self,path):
        return fileModel.getName(path)



    @pyqtSlot(str, result=str)   
    def toHtml(self, text):
        """
        功能: 创建一个槽
        参数: 整数value
        返回值: 字符串
        """
        
        return htmlModel.getHtml(text)

    @pyqtSlot(str,str)
    def getPdf(self,text,path):
        
        pdfModel.getPdf(self.toHtml(text),path)

    @pyqtSlot(str,str,result=str)
    def saveMd(self,text,path):
        name=fileModel.saveMd(text,path)
           
        return name
        

    @pyqtSlot(str, result=str)
    def openMd(self,path):
        
        return fileModel.openMd(path)

    @pyqtSlot(str,str)
    def setEmailAcount(self,sender,password):
        
        emailModel.setEmailAcount(sender,password)



    @pyqtSlot(str,str,str,str)
    def sendMail(self,receiver,content,subject,path):
        
          
        
        paths=[p[8:] for p in path.split('\n')][:-1]
        receivers=[r for r in receiver.split('\n')]
        

        emailModel.sendEmail(receivers,content,subject,paths)

   

if __name__ == "__main__":
  app = QApplication(sys.argv)
  engine = QQmlApplicationEngine()

  con=MyClass()
  ctx = engine.rootContext()
  ctx.setContextProperty("con", con)
  

  engine.load('../view/main.qml')

  win = engine.rootObjects()[0]
  #con.changeText.connect(win.setText)  


  
  win.show()
  sys.exit(app.exec_())
