{ ... }:
{
  flake.nixosModules.thunderbird =
    { ... }:
    {
      home-manager.users.unknown = {
        programs.thunderbird = {
          enable = true;

          profiles.default = {
            isDefault = true;

            settings = {

              # search engine
              "browser.search.defaultenginename" = "DuckDuckGo";
              "browser.search.selectedEngine" = "DuckDuckGo";

              # experimental account hub
              "mail.accounthub.enabled" = false;

              # spell checker
              "mail.SpellCheckBeforeSend" = false;
              "mail.spellcheck.inline" = false;
              "spellchecker.dictionary" = "";

              # web content
              "places.history.enabled" = false;
              "network.cookie.cookieBehavior" = 2;
              "network.cookie.thirdparty.sessionOnly" = true;
              "network.cookie.thirdparty.nonsecureSessionOnly" = true;

              # spam
              "mail.spam.manualMark" = true;
              "mail.spam.manualMarkMode" = 0;

              # data collection
              "datareporting.healthreport.uploadEnabled" = false;
              "datareporting.policy.dataSubmissionEnabled" = false;
              "toolkit.telemetry.enabled" = false;
              "toolkit.telemetry.unified" = false;
              "toolkit.crashreporter.enabled" = false;

              # dns over https
              "network.trr.mode" = 5;
            };
          };
        };
      };
    };
}
