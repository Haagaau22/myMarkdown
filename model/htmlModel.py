import markdown


def getHtml(text):
    head='''<html>
        <head>
        <style>
        body{
        font-size:20pt;
        }
        </style>
        </head>'''
    return head+markdown.markdown(text, extensions=['markdown.extensions.extra','markdown.extensions.admonition','markdown.extensions.codehilite','markdown.extensions.headerid','markdown.extensions.meta','markdown.extensions.nl2br','markdown.extensions.sane_lists','markdown.extensions.smarty','markdown.extensions.toc','markdown.extensions.wikilinks'])

    
