{osConfig, lib, config, inputs, ...}:
{
  config = if (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "firefox" && osConfig.myOptions.desktopTheme.firefoxCss.firefoxUiFix.enable) then {
    home.file = {
      ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome" = {
        source = ./chrome;
        recursive = true;
      };
    };
    programs.firefox.profiles."${osConfig.myOptions.userAccount.username}" = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.has-selector.enabled" = true;
        "browser.urlbar.unitConversion.enabled" = true;
        "browser.urlbar.trimHttps" = false;
        "browser.urlbar.trimURLs" = false;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "widget.gtk.ignore-bogus-leave-notify" = 1;
        "userChrome.tab.connect_to_window" = false;
        "userChrome.tab.color_like_toolbar" = false;
        "userChrome.tab.lepton_like_padding" = false;
        "userChrome.tab.photon_like_padding" = false;
        "userChrome.tab.dynamic_separator" = true;
        "userChrome.tab.static_separator" = false;
        "userChrome.tab.static_separator.selected_accent" = false;
        "userChrome.tab.bar_separator" = false;
        "userChrome.tab.newtab_button_like_tab" = false;
        "userChrome.tab.newtab_button_smaller" = false;
        "userChrome.tab.newtab_button_proton" = true;
        "userChrome.icon.panel_full" = true;
        "userChrome.icon.panel_photon" = false;
        "userChrome.tab.box_shadow" = false;
        "userChrome.tab.bottom_rounded_corner" = false;
        "userChrome.tab.photon_like_contextline" = false;
        "userChrome.rounding.square_tab" = false;
        "userChrome.compatibility.theme" = true;
        "userChrome.compatibility.os" = true;
        "userChrome.theme.built_in_contrast" = true;
        "userChrome.theme.system_default" = true;
        "userChrome.theme.proton_color" = true;
        "userChrome.theme.proton_chrome" = true;
        "userChrome.theme.fully_color" = true;
        "userChrome.theme.fully_dark" = true;
        "userChrome.decoration.cursor" = true;
        "userChrome.decoration.field_border" = true;
        "userChrome.decoration.download_panel" = true;
        "userChrome.decoration.animate" = true;
        "userChrome.padding.tabbar_width" = true;
        "userChrome.padding.tabbar_height" = true;
        "userChrome.padding.toolbar_button" = true;
        "userChrome.padding.navbar_width" = true;
        "userChrome.padding.urlbar" = true;
        "userChrome.padding.bookmarkbar" = true;
        "userChrome.padding.infobar" = true;
        "userChrome.padding.menu" = true;
        "userChrome.padding.bookmark_menu" = true;
        "userChrome.padding.global_menubar" = true;
        "userChrome.padding.panel" = true;
        "userChrome.padding.popup_panel" = true;
        "userChrome.tab.multi_selected" = true;
        "userChrome.tab.unloaded" = true;
        "userChrome.tab.letters_cleary" = true;
        "userChrome.tab.close_button_at_hover" = true;
        "userChrome.tab.sound_hide_label" = true;
        "userChrome.tab.sound_with_favicons" = true;
        "userChrome.tab.pip" = true;
        "userChrome.tab.container" = true;
        "userChrome.tab.crashed" = true;
        "userChrome.fullscreen.overlap" = true;
        "userChrome.fullscreen.show_bookmarkbar" = true;
        "userChrome.icon.library" = true;
        "userChrome.icon.panel" = true;
        "userChrome.icon.menu" = true;
        "userChrome.icon.context_menu" = true;
        "userChrome.icon.global_menu" = true;
        "userChrome.icon.global_menubar" = true;
        "userChrome.icon.1-25px_stroke" = true;
        "userContent.player.ui" = true;
        "userContent.player.icon" = true;
        "userContent.player.noaudio" = true;
        "userContent.player.size" = true;
        "userContent.player.click_to_play" = true;
        "userContent.player.animate" = true;
        "userContent.newTab.full_icon" = true;
        "userContent.newTab.animate" = true;
        "userContent.newTab.pocket_to_last" = true;
        "userContent.newTab.searchbar" = true;
        "userContent.page.field_border" = true;
        "userContent.page.illustration" = true;
        "userContent.page.proton_color" = true;
        "userContent.page.dark_mode" = true;
        "userContent.page.proton" = true;
        "browser.tabs.hoverPreview.enabled" = true;
        "browser.urlbar.clipboard.featureGate" = true;
        "browser.urlbar.suggest.calculator" = true;
      };
    };
  } else {};
}