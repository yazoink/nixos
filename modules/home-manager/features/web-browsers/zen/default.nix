# https://color.firefox.com/?theme=XQAAAAL_AgAAAAAAAABBKYhm849SCicxcUN7ViuG_ebZUZXOFqnmjhZm1VFQCfj9bl943WDccz_Akz8SdUz8TFDGjl_ZSYYSICc2Zbsikn4WogycX4Aie2e8UIx8D0-R1bJlWOnsaWYvvowcHXh2ADAwxi27AXVZyrKfixs7vGPbYXqVtT4SaXQv9ggsolbZNrStW3mxj6bVYfAAnSi3t5-i-43_qmD59hj83e3pcFhlZN5GBTm6_ERzrdCap3Aoog7iGO-nb4dUL1ay7q9-9rTNqKruawiWDvdR813n6v_PeVKseRW4sIC6j0rwvUs_fopDoztHJi5FdjnDgOMzD_It2eC81zKm_6vshk0omkie3-a6kFULzbqWzErFq81W96ldlvO6do-X2YLYsyTzWqTPXqZxX3XU0FkIl4kUwEBn_XlfO4f0uUOxpsJ0t7L8NY6m1AvjGjROm_9S138A
{
  inputs,
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "zen") {
    defaultApps.webBrowser.desktopFile = "zen.desktop";
    home = {
      sessionVariables = {
        MOZ_USE_XINPUT2 = 1;
      };
    };
    stylix.targets.zen-browser.profileNames = ["main"];
    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [pkgs.firefoxpwa];
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
      profiles.main = {
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
          lib.mkMerge [
            [
              ublock-origin
              sponsorblock
              stylus
              violentmonkey
              localcdn
              clearurls
              libredirect
              floccus
              control-panel-for-twitter
            ]
            (lib.mkIf osConfig.myOptions.hardwareFeatures.h264ify.enable [enhanced-h264ify])
          ];
        settings = {
          "zen.workspaces.continue-where-left-off" = true;
          "zen.workspaces.natural-scroll" = true;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.animate-sidebar" = false;
          "zen.welcome-screen.seen" = true;
          "zen.urlbar.behavior" = "float";
          "zen.theme.content-element-separation" = 11;

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
