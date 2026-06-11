# https://color.firefox.com/?theme=XQAAAAL_AgAAAAAAAABBKYhm849SCicxcUN7ViuG_ebZUZXOFqnmjhZm1VFQCfj9bl943WDccz_Akz8SdUz8TFDGjl_ZSYYSICc2Zbsikn4WogycX4Aie2e8UIx8D0-R1bJlWOnsaWYvvowcHXh2ADAwxi27AXVZyrKfixs7vGPbYXqVtT4SaXQv9ggsolbZNrStW3mxj6bVYfAAnSi3t5-i-43_qmD59hj83e3pcFhlZN5GBTm6_ERzrdCap3Aoog7iGO-nb4dUL1ay7q9-9rTNqKruawiWDvdR813n6v_PeVKseRW4sIC6j0rwvUs_fopDoztHJi5FdjnDgOMzD_It2eC81zKm_6vshk0omkie3-a6kFULzbqWzErFq81W96ldlvO6do-X2YLYsyTzWqTPXqZxX3XU0FkIl4kUwEBn_XlfO4f0uUOxpsJ0t7L8NY6m1AvjGjROm_9S138A
{
  inputs,
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  borders =
    if osConfig.myOptions.desktopTheme.zenBrowserShowBorders
    then 15
    else 0;
  inherit (config.lib.stylix) colors;
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "zen-twilight") {
    defaultApps.webBrowser.desktopFile = "zen.desktop";
    home = {
      sessionVariables = {
        MOZ_USE_XINPUT2 = 1;
        MOZ_LEGACY_PROFILES = 1;
      };
    };
    stylix.targets.zen-browser = {
      enable = false;
      profileNames = ["hi"];
    };
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      # nativeMessagingHosts = [pkgs.firefoxpwa]; broken?
      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        SanitizeOnShutdown = {
          FormData = true;
          Cache = true;
        };
      };
      profiles.hi = {
        userChrome = with colors; ''
          :root {
            --zen-colors-primary: #${base02-hex} !important;
            --zen-primary-color: #${base0D-hex} !important;
            --zen-colors-secondary: #${base02-hex} !important;
            --zen-colors-tertiary: #${base01-hex} !important;
            --zen-colors-border: #${base0D-hex} !important;
            --toolbarbutton-icon-fill: #${base0D-hex} !important;
            --lwt-text-color: #${base05-hex} !important;
            --toolbar-field-color: #${base05-hex} !important;
            --toolbar-textcolor: #${base05-hex} !important;
            --toolbox-textcolor: #${base05-hex} !important;
            --tab-selected-textcolor: #${base05-hex} !important;
            --toolbar-field-focus-color: #${base05-hex} !important;
            --toolbar-color: #${base05-hex} !important;
            --newtab-text-primary-color: #${base05-hex} !important;
            --arrowpanel-color: #${base05-hex} !important;
            --arrowpanel-background: #${base00-hex} !important;
            --sidebar-text-color: #${base05-hex} !important;
            --lwt-sidebar-text-color: #${base05-hex} !important;
            --lwt-sidebar-background-color: #${base00-hex} !important;
            --toolbar-bgcolor: #${base02-hex} !important;
            --newtab-background-color: #${base00-hex} !important;
            --zen-themed-toolbar-bg: #${base00-hex} !important;
            --zen-main-browser-background: #${base00-hex} !important;
            --toolbox-bgcolor-inactive: #${base01-hex} !important;
            --zen-themed-toolbar-bg-transparent: #${base01-hex} !important;
          }

          zen-workspace {
            --toolbox-textcolor: #${base05-hex} !important;
          }

          #permissions-granted-icon {
            color: #${base05-hex} !important;
          }

          #historySwipeAnimationPreviousArrow,#historySwipeAnimationNextArrow {
            --swipe-nav-icon-primary-color: #${base0D-hex} !important;
            --swipe-nav-icon-accent-color: #${base00-hex} !important;
          }

          #sidebar-box {
            background-color: #${base00-hex} !important;
          }

          .sidebar-placesTree {
            background-color: #${base00-hex} !important;
          }

          #zen-workspaces-button {
            background-color: #${base00-hex} !important;
          }

          .urlbar-background {
            background-color: #${base02-hex} !important;
          }

          .content-shortcuts {
            background-color: #${base00-hex} !important;
            border-color: #${base0D-hex} !important;
          }

          .urlbarView-url {
            color: #${base0D-hex} !important;
          }

          #urlbar-input::selection {
            background-color: #${base0D-hex} !important;
            color: #${base00-hex} !important;
          }

          #zenEditBookmarkPanelFaviconContainer {
            background: #${base00-hex} !important;
          }

          #zen-media-controls-toolbar {
            & #zen-media-progress-bar {
              &::-moz-range-track {
                background: #${base02-hex} !important;
              }
            }
          }

          toolbar .toolbarbutton-1 {
            &:not([disabled]) {
              &:is([open], [checked])
                > :is(
                  .toolbarbutton-icon,
                  .toolbarbutton-text,
                  .toolbarbutton-badge-stack
                ) {
                fill: #${base00-hex};
              }
            }
          }

          .identity-color-blue {
            --identity-tab-color: #${base0D-hex} !important;
            --identity-icon-color: #${base0D-hex} !important;
          }

          .identity-color-turquoise {
            --identity-tab-color: #${base0C-hex} !important;
            --identity-icon-color: #${base0C-hex} !important;
          }

          .identity-color-green {
            --identity-tab-color: #${base0B-hex} !important;
            --identity-icon-color: #${base0B-hex} !important;
          }

          .identity-color-yellow {
            --identity-tab-color: #${base0A-hex} !important;
            --identity-icon-color: #${base0A-hex} !important;
          }

          .identity-color-orange {
            --identity-tab-color: #${base09-hex} !important;
            --identity-icon-color: #${base09-hex} !important;
          }

          .identity-color-red {
            --identity-tab-color: #${base08-hex} !important;
            --identity-icon-color: #${base08-hex} !important;
          }

          .identity-color-pink {
            --identity-tab-color: #${base0E-hex} !important;
            --identity-icon-color: #${base0E-hex} !important;
          }

          .identity-color-purple {
            --identity-tab-color: #${base0F-hex} !important;
            --identity-icon-color: #${base0F-hex} !important;
          }

          #zen-toolbar-background {
            --zen-main-browser-background-toolbar: #${base00-hex} !important;
          }

          #commonDialog {
            background-color: #${base00-hex} !important;
          }

          #zen-browser-background {
            --zen-main-browser-background: #${base00-hex} !important;
          }

          menu,
          menuitem,
          menupopup {
            color: #${base05-hex} !important;
          }
        '';
        userContent = with colors; ''
          /* Common variables affecting all pages */
          @-moz-document url-prefix("about:") {
            :root {
              --in-content-page-color: #${base05-hex} !important;
              --color-accent-primary: #${base0D-hex} !important;
              --color-accent-primary-hover: #${base0D-hex} !important;
              --color-accent-primary-active: #${base0D-hex} !important;
              background-color: #${base00-hex} !important;
              --in-content-page-background: #${base00-hex} !important;
            }
          }

          /* Variables and styles specific to about:newtab and about:home */
          @-moz-document url("about:newtab"), url("about:home") {

            :root {
              --newtab-background-color: #${base00-hex} !important;
              --newtab-background-color-secondary: #${base02-hex} !important;
              --newtab-element-hover-color: #${base02-hex} !important;
              --newtab-text-primary-color: #${base05-hex} !important;
              --newtab-wordmark-color: #${base05-hex} !important;
              --newtab-primary-action-background: #${base0D-hex}$ !important;
            }

            .icon {
              color: #${base0D-hex} !important;
            }

            .search-wrapper .logo-and-wordmark .logo {
              display: inline-block !important;
              height: 82px !important;
              width: 82px !important;
              background-size: 82px !important;
            }

            @media (max-width: 609px) {
              .search-wrapper .logo-and-wordmark .logo {
                background-size: 64px !important;
                height: 64px !important;
                width: 64px !important;
              }
            }

            .card-outer:is(:hover, :focus, .active):not(.placeholder) .card-title {
              color: #${base0D-hex} !important;
            }

            .top-site-outer .search-topsite {
              background-color: #${base0D-hex} !important;
            }

            .compact-cards .card-outer .card-context .card-context-icon.icon-download {
              fill: #${base0B-hex} !important;
            }
          }

          /* Variables and styles specific to about:preferences */
          @-moz-document url-prefix("about:preferences") {
            :root {
              --zen-colors-tertiary: #${base01-hex} !important;
              --in-content-text-color: #${base05-hex} !important;
              --link-color: #${base0D-hex} !important;
              --link-color-hover: #${base0D-hex} !important;
              --zen-colors-primary: #${base02-hex} !important;
              --in-content-box-background: #${base02-hex} !important;
              --zen-primary-color: #${base0D-hex} !important;
            }

            groupbox , moz-card{
              background: #${base00-hex} !important;
            }

            button,
            groupbox menulist {
              background: #${base02-hex} !important;
              color: #${base05-hex} !important;
            }

            .main-content {
              background-color: #${base00-hex} !important;
            }

            .identity-color-blue {
              --identity-tab-color: #${base0D-hex} !important;
              --identity-icon-color: #${base0D-hex} !important;
            }

            .identity-color-turquoise {
              --identity-tab-color: #${base0C-hex} !important;
              --identity-icon-color: #${base0C-hex} !important;
            }

            .identity-color-green {
              --identity-tab-color: #${base0B-hex} !important;
              --identity-icon-color: #${base0B-hex} !important;
            }

            .identity-color-yellow {
              --identity-tab-color: #${base0A-hex} !important;
              --identity-icon-color: #${base0A-hex} !important;
            }

            .identity-color-orange {
              --identity-tab-color: #${base09-hex} !important;
              --identity-icon-color: #${base09-hex} !important;
            }

            .identity-color-red {
              --identity-tab-color: #${base08-hex} !important;
              --identity-icon-color: #${base08-hex} !important;
            }

            .identity-color-pink {
              --identity-tab-color: #${base0E-hex} !important;
              --identity-icon-color: #${base0E-hex} !important;
            }

            .identity-color-purple {
              --identity-tab-color: #${base0F-hex} !important;
              --identity-icon-color: #${base0F-hex} !important;
            }
          }

          /* Variables and styles specific to about:addons */
          @-moz-document url-prefix("about:addons") {
            :root {
              --zen-dark-color-mix-base: #${base01-hex} !important;
              --background-color-box: #${base00-hex} !important;
            }
          }

          /* Variables and styles specific to about:protections */
          @-moz-document url-prefix("about:protections") {
            :root {
              --zen-primary-color: #${base00-hex} !important;
              --social-color: #${base0E-hex} !important;
              --coockie-color: #${base0D-hex} !important;
              --fingerprinter-color: #${base0A-hex} !important;
              --cryptominer-color: #${base0F-hex} !important;
              --tracker-color: #${base0B-hex} !important;
              --in-content-primary-button-background-hover: #${base03-hex} !important;
              --in-content-primary-button-text-color-hover: #${base05-hex} !important;
              --in-content-primary-button-background: #${base03-hex} !important;
              --in-content-primary-button-text-color: #${base05-hex} !important;
            }

            .card {
              background-color: #${base02-hex} !important;
            }
          }

          ::selection {
            background-color: #${base02-hex} !important;
            color: #${base05-hex} !important;
          }
        '';
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
          lib.mkMerge [
            [
              ublock-origin
              sponsorblock
              stylus
              violentmonkey
              localcdn
              clearurls
              floccus
              control-panel-for-twitter
              keepassxc-browser
            ]
            (lib.mkIf osConfig.myOptions.hardwareFeatures.h264ify.enable [enhanced-h264ify])
          ];
        mods = [
          # "1b88a6d1-d931-45e8-b6c3-bfdca2c7e9d6" # remove tab x
          # "a6335949-4465-4b71-926c-4a52d34bc9c0" # better find bar
          # "b0f635d7-c3bf-4709-af68-4712f0e5b2e5" # cleaner bookmark menu
          # "1e9f3101-210b-4ff5-8830-434e4919100d" # better letterboxing
          # "6c122084-c4ec-4c9e-8cc5-3d87c3a089cb" # navbar margin
        ];
        search = {
          force = true;
          default = "ddg";
        };
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "zen.theme.use-system-colors" = true;
          "zen.theme.gradient.show-custom-colors" = false;
          "zen.theme.gradient" = false;
          "zen.workspaces.continue-where-left-off" = true;
          "zen.workspaces.natural-scroll" = true;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.animate-sidebar" = false;
          "zen.welcome-screen.seen" = true;
          "zen.urlbar.behavior" = "float";
          "zen.theme.content-element-separation" = borders;
          "zen.view.experimental-no-window-controls" = true;
          "zen.urlbar.replace-newtab" = false;
          "zen.view.hide-window-controls" = true;

          "browser.aboutConfig.showWarning" = false;
          "browser.tabs.warnOnClose" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
          # Disable swipe gestures (Browser:BackOrBackDuplicate, Browser:ForwardOrForwardDuplicate)
          "browser.gesture.swipe.left" = "";
          "browser.gesture.swipe.right" = "";
          "browser.tabs.hoverPreview.enabled" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.topsites.contile.enabled" = false;

          "privacy.resistFingerprinting" = false;
          # "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
          # "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
          # "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
          # "privacy.resistFingerprinting.block_mozAddonManager" = true;
          "privacy.spoof_english" = 1;

          "privacy.firstparty.isolate" = true;
          "network.cookie.cookieBehavior" = 5;
          "dom.battery.enabled" = false;

          "gfx.webrender.all" = true;
          "network.http.http3.enabled" = true;
          "network.socket.ip_addr_any.disabled" = true; # disallow bind to 0.0.0.0

          # fastfox
          "gfx.content.skia-font-cache-size" = 32;
          "gfx.canvas.accelerated.cache-items" = 32768;
          "gfx.canvas.accelerated.cache-size" = 4096;
          "webgl.max-size" = 16384;
          "browser.cache.disk.enable" = false;
          "browser.cache.memory.capacity" = 131072;
          "browser.cache.memory.max_entry_size" = 20480;
          "browser.sessionhistory.max_total_viewers" = 4;
          "browser.sessionstore.max_tabs_undo" = 10;
          "media.memory_cache_max_size" = 262144;
          "media.memory_caches_combined_limit_kb" = 1048576;
          "media.cache_readahead_limit" = 600;
          "media.cache_resume_threshold" = 300;
          "image.cache.size" = 10485760;
          "image.mem.decode_bytes_at_a_time" = 65536;
          "network.http.max-connections" = 1800;
          "network.http.max-persistent-connections-per-server" = 10;
          "network.http.request.max-start-delay" = 5;
          "network.http.pacing.requests.enabled" = false;
          "network.dnsCacheEntries" = 10000;
          "network.dnsCacheExpiration" = 3600;
          "network.ssl_tokens_cache_capacity" = 10240;
          "network.http.speculative-parallel-limit" = 0;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.places.speculativeConnect.enabled" = false;
          "network.prefetch-next" = false;
          "network.predictor.enabled" = false;

          # securefox
          "browser.contentblocking.category" = "strict";
          "privacy.trackingprotection.allow_list.baseline.enabled" = true;
          "privacy.trackingprotection.allow_list.convenience.enabled" = true;
          "security.OCSP.enabled" = 0;
          "security.pki.crlite_mode" = 2;
          "browser.sessionstore.interval" = 60000;
          "signon.formlessCapture.enabled" = false;
          "signon.privateBrowsingCapture.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 1;
          "editor.truncate_user_pastes" = false;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "permissions.default.geo" = 2;
          "permissions.default.desktop-notification" = 2;
          "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
          "browser.search.update" = false;
          "permissions.manager.defaultsUrl" = "";
          "browser.newtabpage.activity-stream.default.sites" = true;
          "dom.text_fragments.create_text_fragment.enabled" = true;
        };
      };
    };
  };
}
