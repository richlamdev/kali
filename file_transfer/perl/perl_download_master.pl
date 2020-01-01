#!/usr/bin/perl 
use LWP::Simple; 
$url = 'http://10.11.0.172/pm.c';
$file = 'download_via_perl';
getstore($url, $file);
