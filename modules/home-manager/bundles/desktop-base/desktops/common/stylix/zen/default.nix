{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  stylix.targets.zen-browser = {
    enable = false;
    profileNames = ["hi"];
  };
  programs.zen-browser = {
    profiles.hi = {
      userChrome = with colors; ''
          :root {
            --zen-colors-primary: #${base01-hex} !important;
            --zen-primary-color: #${base0D-hex} !important;
            --zen-colors-secondary: #${base01-hex} !important;
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
            --toolbar-bgcolor: #${base01-hex} !important;
            --newtab-background-color: #${base00-hex} !important;
            --zen-themed-toolbar-bg: #${base00-hex} !important;
            --zen-main-browser-background: #${base00-hex} !important;
            --toolbox-bgcolor-inactive: #${base01-hex} !important;
            --zen-themed-toolbar-bg-transparent: #${base01-hex} !important;
            --input-color: #${base05-hex} !important;
            --zen-native-inner-radius: 16px !important;
            --zen-toolbar-height: 48px !important;
            --toolbarbutton-hover-background: rgba(${base05-rgb-r}, ${base05-rgb-r}, ${base05-rgb-r}, 0.09) !important;
            --panel-color: #${base05-hex} !important;
            --panel-border-color: #${base02-hex} !important;
            --panel-border-radius: 15px !important;
            --zen-toolbar-element-bg: rgba(${base05-rgb-r}, ${base05-rgb-r}, ${base05-rgb-r}, 0.09) !important;
          }

          .zen-toolbar-background {
            box-shadow: none !important;;
            &::before,
            &::after {
              border: none !important;
              outline: none !important;
            }

            &,
            &::before,
            &::after {
              border-radius: 16px !important;;
            }
            &,
             &::before {
              border: 1px solid #${base02-hex} !important;
            }
          }

          .urlbar {
            :root[zen-single-toolbar="true"] &[breakout-extend="true"], &[zen-floating-urlbar="true"] {
              --urlbar-container-padding: 0 !important;;
            }
          }

           #urlbar[breakout-extend="true"] {
              & .urlbar-background {
                border-radius: 16px !important;
                border: none !important;
                box-shadow: none !important;
                outline: none !important;
              }
            }

          .tab-background {
            min-height: 40px !important;
          }

          .tab-content {
            padding: 0 8px !important;
          }

          .tabbrowser-tab[zen-essential="true"], #zen-welcome-initial-essentials-browser-sidebar-essentials .tabbrowser-tab {
            &:hover .tab-background {
              background: var(--zen-toolbar-element-bg) !important;
            }
          }

          :is(menupopup, panel) {
            &::part(content) {
              border-radius: 16px !important;
              border: 1px solid #${base02-hex} !important;
              box-shadow: none !important;
            }
          }

          .menupopup-arrowscrollbox {
             border-radius: 16px !important;
             border: 1px solid #${base02-hex} !important;
             box-shadow: none !important;
          }

          menuitem {
            border-radius: 4px !important;
          }

          menuitem {
          &:hover {
            background-color: rgba(${base05-rgb-r}, ${base05-rgb-r}, ${base05-rgb-r}, 0.09) !important;
            }
          }

          menupopup {
            --panel-padding: 8px !important;
          }

          menuseparator {
            &::before {
              border-top: 1px solid #${base02-hex} !important;
              /*border-top: 2px dashed #${base02-hex} !important;*/
              content: "";
              display: block;
              flex: 1;
            }
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
            background-color: rgba(${base05-rgb-r}, ${base05-rgb-r}, ${base05-rgb-r}, 0.09) !important;
          }

          .content-shortcuts {
            background-color: #${base00-hex} !important;
            border-color: #${base0D-hex} !important;
          }

          .urlbarView-url, .urlbarView-title-separator::before {
            color: #${base0D-hex} !important;
          }

          .urlbarView-row {
            color: #${base05-hex} !important;
          }

          #urlbar-input::selection {
            background-color: #${base0D-hex} !important;
            color: #${base00-hex} !important;
          }

          .urlbarView-row {
            &[selected] {
              & *, & .urlbarView-title-separator::before {
                color: #${base05-hex} !important;
              }
            }
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

          #tabbrowser-tabs {
          & .tabbrowser-tab {
            & .tab-background {
              border-radius: 8px !important;
              box-shadow: none !important;
            }
          }

          .tab-background {
            &:is([selected], [multiselected]) {
              background-color: rgba(${base05-rgb-r}, ${base05-rgb-r}, ${base05-rgb-r}, 0.09) !important;
              outline-color: transparent;
            }
          }

          #urlbar[breakout-extend="true"] {
            &, & .urlbar-background {
              border-radius: 16px !important;
              box-shadow: none !important;
              outline: none !important;
            }
          }
        }

        #urlbar[open][zen-floating-urlbar="true"] {
            & .urlbar-background {
              background: #${base00-hex} !important;
              outline: none !important;
              border: 1px solid #${base02-hex} !important;
              border-radius: 15px !important;
            }
          }

          .urlbar-input-container {
            background-color: rgba(${base05-rgb-r}, ${base05-rgb-r}, ${base05-rgb-r}, 0.09) !important;
          }

          .urlbar[breakout][breakout-extend] {
            & > .urlbar-input-container {
              height: 50px !important;
              margin: 8px !important;
              width: calc(100% - 20px) !important;;
              padding-left: 4px !important;
              padding-right: 16px !important;
            }
          }

          .urlbar {
            &[breakout-extend="true"] {
              --urlbar-container-padding: 0;
            }
          }

          .urlbarView-body-inner {
            #urlbar[open] > .urlbarView > .urlbarView-body-outer > & {
              border-top: 1px solid #${base02-hex} !important;
            }
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
    };
  };
}
