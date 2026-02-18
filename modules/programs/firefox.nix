{ inputs, ... }:
{
  flake.nixosModules.firefox =
    { ... }:
    {
      home-manager.users.unknown = {
        programs.firefox = {
          enable = true;

          profiles.default = {
            isDefault = true;

            search = {
              default = "ddg";
              force = true;
              engines = {
                "google".metaData.hidden = true;
                "bing".metaData.hidden = true;
                "ecosia".metaData.hidden = true;
                "perplexity".metaData.hidden = true;
                "wikipedia".metaData.hidden = true;
              };
            };

            settings = {

              # homepage
              "browser.startup.homepage" = "about:home";
              "browser.newtabpage.enabled" = true;

              # firefox home content
              "browser.newtabpage.activity-stream.showSearch" = true;
              "browser.newtabpage.activity-stream.feeds.topsites" = false;
              "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
              "browser.newtabpage.activity-stream.feeds.snippets" = false;
              "browser.newtabpage.activity-stream.showSponsored" = false;
              "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
              "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
              "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
              "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
              "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
              "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;

              # default search engine
              "browser.urlbar.placeholderName" = "ddg";
              "browser.urlbar.placeholderName.private" = "ddg";

              # search suggestions
              "browser.search.suggest.enabled" = false;
              "browser.urlbar.suggest.searches" = false;
              "browser.urlbar.showSearchSuggestionsFirst" = false;
              "browser.urlbar.suggest.trending" = false;
              "browser.urlbar.suggest.recentsearches" = false;

              # address bar
              "browser.urlbar.suggest.history" = true;
              "browser.urlbar.suggest.bookmark" = true;
              "browser.urlbar.suggest.openpage" = false;
              "browser.urlbar.suggest.topsites" = false;
              "browser.urlbar.suggest.engines" = false;
              "browser.urlbar.suggest.quickactions" = false;
              "browser.urlbar.shortcuts.bookmarks" = false;
              "browser.urlbar.shortcuts.tabs" = false;
              "browser.urlbar.shortcuts.history" = false;

              # tracking policies
              "privacy.trackingprotection.enabled" = true;
              "privacy.trackingprotection.socialtracking.enabled" = true;
              "privacy.trackingprotection.cryptomining.enabled" = true;
              "privacy.trackingprotection.fingerprinting.enabled" = true;
              "privacy.annotate_channels.strict_list.enabled" = true;
              "network.cookie.cookieBehavior" = 5;

              # delete cookies/data on exit
              "privacy.sanitize.sanitizeOnShutdown" = true;
              "privacy.clearOnShutdown.cookies" = true;
              "privacy.clearOnShutdown.cache" = true;
              "privacy.clearOnShutdown.offlineApps" = true;

              # deactivate passwords
              "signon.rememberSignons" = false;
              "signon.autofillForms" = false;
              "signon.generation.enabled" = false;
              "signon.management.page.breach-alerts.enabled" = false;
              "signon.firefoxRelay.feature" = "disabled";

              # deactivate pay methods
              "dom.payments.defaults.saveAddress" = false;
              "extensions.formautofill.creditCards.enabled" = false;

              # deactivate address saving
              "extensions.formautofill.addresses.enabled" = false;

              # disable history
              "browser.privatebrowsing.autostart" = true;
              "places.history.enabled" = false;

              #disable popups
              "dom.disable_open_during_load" = true;

              # disable data collection
              "datareporting.usage.uploadEnabled" = false;
              "datareporting.healthreport.uploadEnabled" = false;
              "datareporting.policy.dataSubmissionEnabled" = false;
              "toolkit.telemetry.enabled" = false;
              "toolkit.telemetry.unified" = false;
              "toolkit.telemetry.bhrPing.enabled" = false;
              "toolkit.telemetry.firstShutdownPing.enabled" = false;
              "toolkit.telemetry.newProfilePing.enabled" = false;
              "toolkit.telemetry.updatePing.enabled" = false;
              "toolkit.telemetry.shutdownPingSender.enabled" = false;
              "app.shield.optoutstudies.enabled" = false;
              "browser.ping-centre.telemetry" = false;
              "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

              # disable personalized recommendations
              "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
              "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;

              # activate safe browsing
              "browser.safebrowsing.malware.enabled" = true;
              "browser.safebrowsing.phishing.enabled" = true;
              "browser.safebrowsing.downloads.enabled" = true;
              "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = true;
              "browser.safebrowsing.downloads.remote.block_uncommon" = true;

              # only https
              "dom.security.https_only_mode" = true;
              "dom.security.https_only_mode_ever_enabled" = true;

              # dns over https
              "network.trr.mode" = 5;
            };

            extensions.packages = with inputs.nur.legacyPackages.x86_64-linux.repos.rycee.firefox-addons; [
              bitwarden
              vimium
              darkreader
              catppuccin-mocha-mauve
            ];

            bookmarks = {
              force = true;
              settings = [
                {
                  name = "Toolbar";
                  toolbar = true;
                  bookmarks = [
                    {
                      name = "claude";
                      url = "https://claude.ai";
                    }
                    {
                      name = "github";
                      url = "https://github.com";
                    }
                    {
                      name = "gateway";
                      url = "https://192.168.1.1";
                    }
                    {
                      name = "nas";
                      url = "http://192.168.10.150:5000";
                    }
                    {
                      name = "portainer";
                      url = "http://192.168.10.150:8080";
                    }
                    {
                      name = "adguard";
                      url = "http://192.168.10.150:8081";
                    }
                    {
                      name = "nextcloud";
                      url = "http://192.168.10.150:8180";
                    }
                    {
                      name = "immich";
                      url = "http://192.168.10.150:8181";
                    }
                    {
                      name = "akad";
                      url = "https://akad-campus.de";
                    }
                  ];
                }
              ];
            };
          };
        };
      };
    };
}
