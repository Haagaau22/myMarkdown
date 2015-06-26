import sys

def saveMd(text,path):
    path=path[8:]
    with open(path,'w') as f:
        f.write(text)

    
    return getName(path)

def openMd(path):
    path=path[8:]
    
    text=''
    with open(path,'r') as f:
        text=f.read()
    
    return text

def getName(path):
    return path.split(r'/')[-1]
