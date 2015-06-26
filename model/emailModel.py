 #!/usr/bin/env python3  
#coding: utf-8  

import os
from envelopes import Envelope  


def setEmailAcount(sender,password):
    with open('data.ini','w')as f:
        f.write(sender+" "+password)
    
    
    

def getEmailAcount():
    with open('data.ini','r')as f:
        return f.read().split(' ')

def sendEmail(receivers,content,subject,paths):
    
    sender,password=getEmailAcount() 
    server='smtp.'+(sender.split('.')[0]).split('@')[1]+'.com'  
    

    envelope = Envelope(
        from_addr=(sender, u'zonzely'),
        to_addr=receivers,
        subject=subject,
        text_body=content
    )

    for path in paths:
        envelope.add_attachment(path)
    

    
    envelope.send(server, login=sender,
                    password=password, tls=True)








    

