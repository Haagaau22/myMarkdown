import pdfkit

def getPdf(html,path):
    head='''
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>

    '''

    pdfkit.from_string(head+html, path[8:])
