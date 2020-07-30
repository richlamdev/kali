/* ========================================================

*** COPIED FROM: https://bitbucket.org/mrbbking/quieter-firefox/src/master/ ***

# For Burp Suite http(s) traffic interception

/usr/bin/firefox-esr -CreateProfile burpsuite
cp user.js ~/.mozilla/firefox/*.burpsuite/.

# run firefox with -ProfileManager and select burpsuite as default profile
# /usr/bin/firefox-esr -ProfileManager

// Set default proxy to 127.0.0.1 / port 8080 
// Burp Suite default interception

user_pref("network.proxy.backup.ftp", "");
user_pref("network.proxy.backup.ftp_port", 0); 
user_pref("network.proxy.backup.socks", "");
user_pref("network.proxy.backup.socks_port", 0); 
user_pref("network.proxy.backup.ssl", "");
user_pref("network.proxy.backup.ssl_port", 0); 
user_pref("network.proxy.ftp", "127.0.0.1");
user_pref("network.proxy.ftp_port", 8080);
user_pref("network.proxy.http", "127.0.0.1");
user_pref("network.proxy.http_port", 8080);
user_pref("network.proxy.share_proxy_settings", true);
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks_port", 8080);
user_pref("network.proxy.ssl", "127.0.0.1");
user_pref("network.proxy.ssl_port", 8080);
user_pref("network.proxy.type", 1); 


======================================================== */


/* ========================================================

   A user.js for a Quieter Firefox

   Save as "user.js" in your Firefox user directory, which
   has a random string in it, represented by "blah" below:

   Windows:
     %appdata%\Mozilla\Firefox\Profiles\blah.default\user.js

   Linux:
	   ~/.mozilla/firefox/blah.default/user.js

   MacOS:
      ~/Library/Application Support/Firefox/Profiles/
      or
      ~/Library/Mozilla/Firefox/Profiles/
      (May be hidden: http://kb.mozillazine.org/Show_hidden_files_and_folders#Mac_OS_X)

   Purpose: Eliminate HTTP and HTTPS traffic from Firefox
            that is not user-initiated, and is not the
            result of content from visited websites. This
            is to support webapp testing, so that the only
            traffic from Firefox is traffic relevant to
            the sites being visited.

   This is not a "privacy" or "security" thing.
   It's pretty bad for security, actually.

   Additions encouraged: please send a PR or add an issue.

   Please also include a reference that explains the
   setting you're proposing to alter.

  ======================================================== */

/* ==== Falses ==== */
user_pref("app.update.auto", false);            // don't auto-update
user_pref("app.update.enabled", false);         // don't even look for updates
user_pref("app.update.staging.enabled", false); // need this, too?
user_pref("browser.casting.enabled", false);    // disable SSDP
user_pref("browser.newtabbage.enabled", false); // new empty tab is empty
user_pref("browser.safebrowsing.downloads.enabled", false);  // skip safebrowsing
user_pref("browser.safebrowsing.malware.enabled", false);    // ""
user_pref("browser.safebrowsing.phishing.enabled", false);   // ""
user_pref("browser.search.suggest.enabled", false);          // don't send search keystrokes
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("extensions.blocklist.enabled", false);            // don't update blocklist
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.update.autoUpdateDefault", false);
user_pref("extensions.update.enabled", false);               // don't check for extension updates
user_pref("network.captive-portal-service.enabled", false);  // no 'detectportal.firefox.com'
user_pref("network.prefetch-next", false);                   // don't get what I haven't asked for
user_pref("privacy.trackingprotection.pbmode.enabled", false);
user_pref("network.connectivity-service.enabled", false);    // new route to "detectportal" thing

// 2020-05
user_pref("services.sync.prefs.sync.browser.urlbar.matchBuckets", false);
user_pref("services.sync.sendVersionInfo", false);
user_pref("dom.push.enabled", false);

/* == Disable Sync Altogether == */
/* == STIG: https://www.stigviewer.com/stig/mozilla_firefox/2017-03-22/finding/V-57673 == */
user_pref("services.sync.autoconnect", false);
user_pref("services.sync.engine.addons", false);
user_pref("services.sync.engine.bookmarks", false);
user_pref("services.sync.engine.history", false);
user_pref("services.sync.engine.passwords", false);
user_pref("services.sync.engine.prefs", false);
user_pref("services.sync.engine.tabs", false);

user_pref("app.shield.optoutstudies.enabled", false);


/* ==== Trues ==== */
user_pref("network.dns.disablePrefetch", true);
user_pref("browser.sessionstore.debug.no_auto_updates", true); // guessing here: stop it going to https://aus5.mozilla.org/update/6/Firefox/76.0.1/blah-blah-blah/update.xml


/* ==== Zeros ==== */
user_pref("browser.startup.page", 0);
user_pref("network.http.speculative-parallel-limit", 0);


/* ==== Empties ==== */
user_pref("browser.aboutHomeSnippets.updateUrl", "");
// These next two might be resolved with "browser.safebrowsing.downloads.enabled" above
// ... nope! Uncommenting them
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");
user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");

// I don't see a related true/false option for this one.
// default was https://discovery.addons.mozilla.org/%LOCALE%/firefox/discovery/pane/%VERSION%/%OS%/%COMPATIBILITY_MODE%
user_pref("extensions.webservice.discoverURL", "");

// https://wiki.mozilla.org/Advocacy/heartbeat
user_pref("browser.selfsupport.url","");

user_pref("app.update.channel","NONE"); // guessing. Was "release"

/* ==== Special Cases ==== */
user_pref("browser.startup.homepage_override.mstone","ignore");


/* === Mysteries ==== */
// This UI pane calls www.google-analytics.com and addons-discovery.cdn.mozilla.net.
// https://discovery.addons.mozilla.org/en-US/firefox/discovery/pane/53.0/WINNT/normal
