{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}: let
  baseImage = ./image.png;
in {
  options = {
    bundles.desktopBase.rofi.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.rofi.enable {
    stylix.targets.rofi.enable = false;
    programs.rofi = builtins.trace "rofi module enabled" {
      enable = true;
      package = pkgs.rofi-wayland;
      font = "${config.stylix.fonts.sansSerif.name} 11";
      terminal = "${pkgs.foot}/bin/foot";
    };

    xdg.configFile."rofi/config.rasi".text = lib.mkForce ''
      configuration {
        location: 0;
        yoffset: 0;
        xoffset: 0;
        terminal: "${pkgs.foot}/bin/foot";
      }
      @theme "my-theme"
    '';

    xdg.configFile."rofi/my-theme.rasi".text = with config.stylix.base16Scheme;
      lib.mkForce ''
        /*****----- Configuration -----*****/
        configuration {
          modi:                       "drun,run,filebrowser,window";
            show-icons:                 false;
            display-drun:               "Apps";
            display-run:                "Run";
            display-filebrowser:        "Files";
            display-window:             "Windows";
          drun-display-format:        "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
          window-format:              "{w} · {c} · {t}";
        }

        * {
            font: "${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.popups}";
            background:     #${base00}FF;
            background-alt: #${base01}FF;
            foreground:     #${base05}FF;
            selected:       #${base02}FF;
            active:         #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}FF;
            urgent:         #${base08}FF;
        }

        /*****----- Configuration -----*****/
        configuration {
        	modi:                       "drun,run,filebrowser,window";
            show-icons:                 true;
            display-drun:               "Apps";
            display-run:                "Run";
            display-filebrowser:        "Files";
            display-window:             "Windows";
        	drun-display-format:        "{name}";
        	window-format:              "{w} · {c} · {t}";
        }

        /*****----- Global Properties -----*****/
        * {
            border-colour:               var(background-alt);
            handle-colour:               var(selected);
            background-colour:           var(background);
            foreground-colour:           var(foreground);
            alternate-background:        var(background-alt);
            normal-background:           var(background);
            normal-foreground:           var(foreground);
            urgent-background:           var(urgent);
            urgent-foreground:           var(background);
            active-background:           var(active);
            active-foreground:           var(foreground);
            selected-normal-background:  var(selected);
            selected-normal-foreground:  var(foreground);
            selected-urgent-background:  var(active);
            selected-urgent-foreground:  var(foreground);
            selected-active-background:  var(urgent);
            selected-active-foreground:  var(background);
            alternate-normal-background: var(background);
            alternate-normal-foreground: var(foreground);
            alternate-urgent-background: var(urgent);
            alternate-urgent-foreground: var(background);
            alternate-active-background: var(active);
            alternate-active-foreground: var(foreground);
        }

        /*****----- Main Window -----*****/
        window {
            /* properties for window widget */
            transparency:                "real";
            location:                    center;
            anchor:                      center;
            fullscreen:                  false;
            width:                       600px;
            x-offset:                    0px;
            y-offset:                    0px;

            /* properties for all widgets */
            enabled:                     true;
            margin:                      0px;
            padding:                     0px;
            border:                      1px solid;
            border-radius:               10px;
            border-color:                @border-colour;
            cursor:                      "default";
            /* Backgroud Colors */
            background-color:            @background-colour;
            /* Backgroud Image */
            //background-image:          url("/path/to/image.png", none);
            /* Simple Linear Gradient */
            //background-image:          linear-gradient(red, orange, pink, purple);
            /* Directional Linear Gradient */
            //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
            /* Angle Linear Gradient */
            //background-image:          linear-gradient(45, cyan, purple, indigo);
        }

        /*****----- Main Box -----*****/
        mainbox {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     30px;
            border:                      0px solid;
            border-radius:               0px 0px 0px 0px;
            border-color:                @border-colour;
            background-color:            transparent;
            children:                    [ "inputbar", "message", "listview" ];
        }

        /*****----- Inputbar -----*****/
        inputbar {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               0px;
            border-color:                @border-colour;
            background-color:            transparent;
            text-color:                  @foreground-colour;
            children:                    [ "textbox-prompt-colon", "entry", "mode-switcher" ];
        }

        prompt {
            enabled:                     true;
            background-color:            inherit;
            text-color:                  inherit;
        }
        textbox-prompt-colon {
            enabled:                     true;
            padding:                     5px 0px;
            expand:                      false;
            str:                         "";
            background-color:            inherit;
            text-color:                  inherit;
        }
        entry {
            enabled:                     true;
            padding:                     5px 0px;
            background-color:            inherit;
            text-color:                  inherit;
            cursor:                      text;
            placeholder:                 "Search...";
            placeholder-color:           inherit;
        }
        num-filtered-rows {
            enabled:                     true;
            expand:                      false;
            background-color:            inherit;
            text-color:                  inherit;
        }
        textbox-num-sep {
            enabled:                     true;
            expand:                      false;
            str:                         "/";
            background-color:            inherit;
            text-color:                  inherit;
        }
        num-rows {
            enabled:                     true;
            expand:                      false;
            background-color:            inherit;
            text-color:                  inherit;
        }
        case-indicator {
            enabled:                     true;
            background-color:            inherit;
            text-color:                  inherit;
        }

        /*****----- Listview -----*****/
        listview {
            enabled:                     true;
            columns:                     1;
            lines:                       8;
            cycle:                       true;
            dynamic:                     true;
            scrollbar:                   true;
            layout:                      vertical;
            reverse:                     false;
            fixed-height:                true;
            fixed-columns:               true;

            spacing:                     5px;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               0px;
            border-color:                @border-colour;
            background-color:            transparent;
            text-color:                  @foreground-colour;
            cursor:                      "default";
        }
        scrollbar {
            handle-width:                5px ;
            handle-color:                @handle-colour;
            border-radius:               10px;
            background-color:            @alternate-background;
        }

        /*****----- Elements -----*****/
        element {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     5px 10px;
            border:                      0px solid;
            border-radius:               10px;
            border-color:                @border-colour;
            background-color:            transparent;
            text-color:                  @foreground-colour;
            cursor:                      pointer;
        }
        element normal.normal {
            background-color:            var(normal-background);
            text-color:                  var(normal-foreground);
        }
        element normal.urgent {
            background-color:            var(urgent-background);
            text-color:                  var(urgent-foreground);
        }
        element normal.active {
            background-color:            var(active-background);
            text-color:                  var(active-foreground);
        }
        element selected.normal {
            background-color:            var(selected-normal-background);
            text-color:                  var(selected-normal-foreground);
        }
        element selected.urgent {
            background-color:            var(selected-urgent-background);
            text-color:                  var(selected-urgent-foreground);
        }
        element selected.active {
            background-color:            var(selected-active-background);
            text-color:                  var(selected-active-foreground);
        }
        element alternate.normal {
            background-color:            var(alternate-normal-background);
            text-color:                  var(alternate-normal-foreground);
        }
        element alternate.urgent {
            background-color:            var(alternate-urgent-background);
            text-color:                  var(alternate-urgent-foreground);
        }
        element alternate.active {
            background-color:            var(alternate-active-background);
            text-color:                  var(alternate-active-foreground);
        }
        element-icon {
            background-color:            transparent;
            text-color:                  inherit;
            size:                        24px;
            cursor:                      inherit;
        }
        element-text {
            background-color:            transparent;
            text-color:                  inherit;
            highlight:                   inherit;
            cursor:                      inherit;
            vertical-align:              0.5;
            horizontal-align:            0.0;
        }

        /*****----- Mode Switcher -----*****/
        mode-switcher{
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               0px;
            border-color:                @border-colour;
            background-color:            transparent;
            text-color:                  @foreground-colour;
        }
        button {
            padding:                     5px 10px;
            border:                      0px solid;
            border-radius:               10px;
            border-color:                @border-colour;
            background-color:            @alternate-background;
            text-color:                  inherit;
            cursor:                      pointer;
        }
        button selected {
            background-color:            var(selected-normal-background);
            text-color:                  var(selected-normal-foreground);
        }

        /*****----- Message -----*****/
        message {
            enabled:                     true;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               0px 0px 0px 0px;
            border-color:                @border-colour;
            background-color:            transparent;
            text-color:                  @foreground-colour;
        }
        textbox {
            padding:                     8px 10px;
            border:                      0px solid;
            border-radius:               10px;
            border-color:                @border-colour;
            background-color:            @alternate-background;
            text-color:                  @foreground-colour;
            vertical-align:              0.5;
            horizontal-align:            0.0;
            highlight:                   none;
            placeholder-color:           @foreground-colour;
            blink:                       true;
            markup:                      true;
        }
        error-message {
            padding:                     10px;
            border:                      2px solid;
            border-radius:               10px;
            border-color:                @border-colour;
            background-color:            @background-colour;
            text-color:                  @foreground-colour;
        }
      '';
  };
}
