{config, pkgs, lib, osConfig, ...}:
let
  baseImage = ./image.png;
in
{
  options = {
    bundles.desktopBase.rofi.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.rofi.enable {
    stylix.targets.rofi.enable = false;
    utils.dither.enable = true;
    programs.rofi = builtins.trace "rofi module enabled" {
      enable = true;
      package = pkgs.rofi-wayland;
      font = "${config.stylix.fonts.sansSerif.name} 11";
      terminal = "${pkgs.foot}/bin/foot";
    };

    systemd.user.services.dither-rofi = {
      Unit.Description = "Dither the Rofi image";
      Service = {
        Type = "oneshot";
        ExecStart = with config.stylix.base16Scheme; "${config.utils.dither.package}/bin/dither ${base00} ${base01} ${base02} ${base03} ${base04} ${base05} ${base06} ${base07} ${base08} ${base09} ${base0A} ${base0B} ${base0C} ${base0D} ${base0E} ${base0F} ${baseImage} /home/${osConfig.myOptions.userAccount.username}/.config/rofi/image.png";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };

    #home.file.".config/rofi/image.png".source =  ./images/image-${osConfig.myOptions.desktopTheme.name}.png;
    xdg.configFile."rofi/config.rasi".text = lib.mkForce ''
      configuration {
        location: 0;
        yoffset: 0;
        xoffset: 0;
        terminal: "${pkgs.foot}/bin/foot";
      }
      @theme "my-theme"
    '';
    xdg.configFile."rofi/my-theme.rasi".text = with config.stylix; lib.mkForce ''
      /**
       *
       * Author : Aditya Shakya (adi1090x), yazoink
       * Github : @adi1090x, @yazoink
       * 
       * Rofi Theme File
       * Rofi Version: 1.7.3
       **/

      /*****----- Configuration -----*****/
      configuration {
        modi:                       "drun,run,filebrowser,window";
        show-icons:                 true;
        display-drun:               "Apps";
        display-run:                "Run";
        display-filebrowser:        "Files";
        display-window:             "Window";
        drun-display-format:        "{name}";
        window-format:              "{w} · {c} · {t}";
      }

      /*****----- Global Properties -----*****/
      * {
          font:                        "${fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.popups}";
          background:                  #${base16Scheme.base00};
          background-alt:              #${base16Scheme.base01};
          background-alt-2:            #${base16Scheme.base02};
          foreground:                  #${base16Scheme.base05};
          selected:                    #${base16Scheme.base01};
          active:                      #${base16Scheme.base01};
          urgent:                      #${base16Scheme.base01};
          highlight:                   #${base16Scheme.${osConfig.desktopTheme.base16Accent}};
      }

      /*****----- Main Window -----*****/
      window {
          /* properties for window widget */
          transparency:                "real";
          location:                    center;
          anchor:                      center;
          fullscreen:                  false;
          width:                       1000px;
          x-offset:                    0px;
          y-offset:                    0px;


          /* properties for all widgets */
          enabled:                     true;
          border-radius:               10px;
          border:                      2px;
          border-color:                @active;
          cursor:                      "default";
          background-color:            @background;
      }

      /*****----- Main Box -----*****/
      mainbox {
          enabled:                     true;
          spacing:                     0px;
          background-color:            transparent;
          orientation:                 horizontal;
          children:                    [ "imagebox", "listbox" ];
      }

      imagebox {
          padding:                     10px;
          background-color:            transparent;
          background-image:            url("~/.config/rofi/image.png", none);
          orientation:                 vertical;
          children:                    [ "inputbar", "dummy", "mode-switcher" ];
      }

      listbox {
          spacing:                     10px;
          padding:                     10px;
          background-color:            transparent;
          orientation:                 vertical;
          children:                    [ "message", "listview" ];
      }

      dummy {
          background-color:            transparent;
      }

      /*****----- Inputbar -----*****/
      inputbar {
          enabled:                     true;
          spacing:                     10px;
          padding:                     10px;
          border-radius:               10px;
          background-color:            @background-alt;
          text-color:                  @foreground;
          children:                    [ "textbox-prompt-colon", "entry" ];
      }
      textbox-prompt-colon {
          enabled:                     true;
          expand:                      false;
          str:                         ">";
          background-color:            inherit;
          text-color:                  inherit;
      }
      entry {
          enabled:                     true;
          background-color:            inherit;
          text-color:                  inherit;
          cursor:                      text;
          placeholder:                 "Search";
          placeholder-color:           inherit;
      }

      /*****----- Mode Switcher -----*****/
      mode-switcher{
          enabled:                     true;
          spacing:                     10px;
          background-color:            transparent;
          text-color:                  @foreground;
          font-weight: bold;
      }
      button {
          padding:                     10px;
          border-radius:               10px;
          background-color:            @background-alt;
          text-color:                  inherit;
          cursor:                      pointer;
      }
      button selected {
          background-color:            @background-alt-2;
          text-color:                  @foreground;
      }

      /*****----- Listview -----*****/
      listview {
          enabled:                     true;
          columns:                     1;
          lines:                       8;
          cycle:                       true;
          dynamic:                     true;
          scrollbar:                   false;
          layout:                      vertical;
          reverse:                     false;
          fixed-height:                true;
          fixed-columns:               true;
          
          spacing:                     10px;
          background-color:            @background;
          text-color:                  @foreground;
          cursor:                      "default";
      }

      /*****----- Elements -----*****/
      element {
          enabled:                     true;
          spacing:                     10px;
          padding:                     8px;
          border-radius:               10px;
          background-color:            @background;
          text-color:                  @foreground;
          cursor:                      pointer;
      }
      element normal.normal {
          background-color:            inherit;
          text-color:                  inherit;
      }
      element alternate.normal {
          background-color:            inherit;
          text-color:                  inherit;
      }
      element normal.urgent {
          background-color:            @urgent;
          text-color:                  @foreground;
      }
      element normal.active {
          background-color:            @active;
          text-color:                  @foreground;
      }
      element selected.normal {
          background-color:            @selected;
          text-color:                  @foreground;
      }
      element selected.urgent {
          background-color:            @urgent;
          text-color:                  @foreground;
      }
      element selected.active {
          background-color:            @urgent;
          text-color:                  @foreground;
      }
      element-icon {
          background-color:            transparent;
          text-color:                  inherit;
          size:                        32px;
          cursor:                      inherit;
      }
      element-text {
          background-color:            transparent;
          text-color:                  inherit;
          cursor:                      inherit;
          vertical-align:              0.5;
          horizontal-align:            0.0;
      }

      /*****----- Message -----*****/
      message {
          background-color:            transparent;
      }
      textbox {
          padding:                     10px;
          border-radius:               10px;
          background-color:            @background-alt;
          text-color:                  @foreground;
          vertical-align:              0.5;
          horizontal-align:            0.0;
      }
      error-message {
          padding:                     10px;
          border-radius:               10px;
          background-color:            @background;
          text-color:                  @foreground;
      }
    '';
  };
}
