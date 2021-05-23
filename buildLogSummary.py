#!/usr/bin/env python3

import sys
import os
from lxml import etree
import GetFileName as filename

XSLPATH = r'C://Users/twink/Desktop/Python_Jenkins_assignment/buildLogXSL.xsl'
XMLPATH = r'C://Users/twink/Desktop/Python_Jenkins_assignment/buildLogXML.xml'
HTMLFOLDERPATH = r'C://Users/twink/Desktop/Python_Jenkins_assignment/'

HTMLPATH = HTMLFOLDERPATH+'\\' + \
    filename.GetFileNameWithoutExtension(XMLPATH)+'.html'

if os.path.isfile(XMLPATH):
    XSLT_DOC = etree.parse(XSLPATH)
    XSLT_TRANSFORMER = etree.XSLT(XSLT_DOC)
    SOURCE_DOC = etree.parse(XMLPATH)
    OUTPUT_DOC = XSLT_TRANSFORMER(SOURCE_DOC)
    with open(HTMLPATH, 'w+') as f:
        f.write(str(OUTPUT_DOC))
    print("Successfully Generated HTML file  {}".format(HTMLPATH))

