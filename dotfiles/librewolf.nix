{ inputs, pkgs, ... }:
{
  programs.librewolf = {
    package = pkgs.librewolf;
    enable = true;

    profiles.main = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        sponsorblock
        violentmonkey
        darkreader
        qwant-search
        bitwarden
      ];

      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://www.qwant.com/";
        "browser.search.defaultenginename" = "Qwant";
        "browser.search.selectedEngine" = "Qwant";
        "browser.urlbar.placeholderName" = "Qwant";
        "cookiebanners.service.mode.privateBrowsing" = 2;
        "cookiebanners.service.mode" = 2;
        "privacy.donottrackheader.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "network.cookie.lifetimePolicy" = 0;
        "sidebar.verticalTabs" = true;
        "extensions.autoDisableScopes" = 0;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.tabs.tabmanager.enabled" = false;
        "browser.tabs.firefox-view" = false;
        "browser.uiCustomization.state" = ''
          {
            "placements": {
              "widget-overflow-fixed-list": [],
              "unified-extensions-area": [
                "addon_darkreader_org-browser-action",
                "_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action",
                "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
              ],
              "nav-bar": [
                "back-button",
                "forward-button",
                "stop-reload-button",
                "vertical-spacer",
                "urlbar-container",
                "vertical-spacer",
                "unified-extensions-button",
                "ublock0_raymondhill_net-browser-action"
              ],
              "TabsToolbar": [],
              "vertical-tabs": [
                "tabbrowser-tabs"
              ],
              "PersonalToolbar": [
                "import-button",
                "personal-bookmarks"
              ]
            },
            "seen": [
              "addon_darkreader_org-browser-action",
              "_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action",
              "sponsorblocker_ajay_app-browser-action",
              "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action",
              "developer-button",
              "ublock0_raymondhill_net-browser-action"
            ],
            "dirtyAreaCache": [
              "unified-extensions-area",
              "nav-bar",
              "TabsToolbar",
              "vertical-tabs",
              "PersonalToolbar"
            ],
            "currentVersion": 22,
            "newElementCount": 0
          }
        '';
      };
    };

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      "3rdparty" = {
        Extensions = {
          "uBlock0@raymondhill.net" = {
            "adminSettings" = {
              # https://github.com/gorhill/uBlock/blob/master/assets/assets.json
              "selectedFilterLists" = [
                "user-filters"
                "ublock-filters"
                "ublock-badware"
                "ublock-privacy"
                "ublock-quick-fixes"
                "ublock-unbreak"
                "adguard-cookies"
                "ublock-adguard-cookies"
                "ublock-easylist-cookies"
                "fanboy-cookiemonster"
                "easylist"
              ];
            };
          };
        };
      };
    };
  };
}
