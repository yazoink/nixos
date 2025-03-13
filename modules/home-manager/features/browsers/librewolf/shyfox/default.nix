{
  osConfig,
  lib,
  config,
  inputs,
  ...
}: let
  shyVars = config.lib.stylix.colors {
    template = ./chrome/ShyFox/${osConfig.desktopTheme.base16Accent}-shy-variables.css.mustache;
    extension = ".css";
  };
in {
  config =
    if (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "firefox" && osConfig.myOptions.desktopTheme.firefoxCss.shyfox.enable)
    then {
      home.file = {
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/icons" = {
          source = ./chrome/icons;
          recursive = true;
        };
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/content" = {
          source = ./chrome/ShyFox/content;
          recursive = true;
        };
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userChrome.css".source = ./chrome/userChrome.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userContent.css".source = ./chrome/userContent.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/wallpaper.png".source = osConfig.myOptions.desktopTheme.firefoxCss.shyfox.wallpaper;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-compact.css".source = ./chrome/ShyFox/shy-compact.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-controls.css".source = ./chrome/ShyFox/shy-controls.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-findbar.css".source = ./chrome/ShyFox/shy-findbar.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-floating-search.css".source = ./chrome/ShyFox/shy-floating-search.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-global.css".source = ./chrome/ShyFox/shy-global.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-icons.css".source = ./chrome/ShyFox/shy-icons.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-navbar.css".source = ./chrome/ShyFox/shy-navbar.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-sidebar.css".source = ./chrome/ShyFox/shy-sidebar.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-toolbar.css".source = ./chrome/ShyFox/shy-toolbar.css;
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/ShyFox/shy-variables.css".source = shyVars;
      };
      programs.firefox.profiles."${osConfig.myOptions.userAccount.username}" = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "sidebar.revamp" = false;
          "svg.context-properties.content.enabled" = true;
          "layout.css.has-selector.enabled" = true;
          "browser.urlbar.suggest.calculator" = true;
          "browser.urlbar.unitConversion.enabled" = true;
          "browser.urlbar.trimHttps" = false;
          "browser.urlbar.trimURLs" = false;
          "widget.gtk.rounded-bottom-corners.enabled" = true;
          "widget.gtk.ignore-bogus-leave-notify" = 1;
          "shyfox.disable.floating.search" = true;
          "shyfox.remove.window.controls" = true;
          "shyfox.enable.ext.mono.toolbar.icons" = true;
          "shyfox.enable.ext.mono.context.icons" = true;
        };
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          userchrome-toggle-extended
          sidebery
        ];
      };
    }
    else {};
}
