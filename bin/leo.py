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

import xml.etree.ElementTree as ET
import sys
import urllib2

search = urllib2.quote(' '.join(sys.argv))
searchurl = 'http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&rmWords=off&rmSearch=on&search=%s&searchLoc=0&resultOrder=basic&multiwordShowSingle=on' % (search)

xmldoc=None
method=1

if method==1:
    url = urllib2.urlopen(searchurl)
    xmldoc = ET.parse(url)
else:
    # for testing
    xmldoc = ET.parse("leo.xml")

langs = ['en', 'de']

entries = xmldoc.findall('.//entry')
for entry in entries:
    trans = {}

    for lang in langs:
        trans[lang] = []
        sides = entry.findall("side[@lang='%s']/words" % lang)
        for side in sides:
            words = side.findall("word")
            for word in words:
                trans[lang].append(word.text)

    trans_list = []
    for lang in langs:
        trans_list.append( "\n".join(trans[lang]).encode('utf-8') )
    print " : ".join(trans_list)
    print ""

