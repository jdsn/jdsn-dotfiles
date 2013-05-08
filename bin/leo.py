#!/usr/bin/python
#
# Author:  J. Daniel Schmidt <mail@jdsn.de>
# Date:    2013
# License: GPL-2.0
#

# recommended usage: leo <search> <terms>
#
# > cat ~/bin/leo
# #!/bin/bash
# python ~/bin/leo.py $@ | less
#

import pycurl
import cStringIO
import xml.etree.ElementTree as ET
import sys
import urllib

search = urllib.quote(' '.join(sys.argv))

xmldoc=None
buffer = cStringIO.StringIO()

searchurl = 'http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&rmWords=off&rmSearch=on&search=%s&searchLoc=0&resultOrder=basic&multiwordShowSingle=on' % (search)

if 1:
    curl = pycurl.Curl()
    curl.setopt(curl.URL, searchurl)
    curl.setopt(curl.WRITEFUNCTION, buffer.write)
    curl.perform()
    xmlstr = buffer.getvalue()
    buffer.close()
    xmldoc = ET.fromstring(xmlstr)
else:
    # for testing
    xmldoc = ET.parse("leo.xml")

langs = ['en', 'de']

entries = xmldoc.findall('.//entry')
for entry in entries:
    trans = {}

    for lang in langs:
        trans[lang] = []
        sides = entry.findall("./side[@lang='%s']/words" % lang)
        for side in sides:
            words = side.findall("./word")
            for word in words:
                trans[lang].append(word.text)

    trans_list = []
    for lang in langs:
        trans_list.append( "\n".join(trans[lang]).encode('utf-8') )
    print " : ".join(trans_list)
    print ""

