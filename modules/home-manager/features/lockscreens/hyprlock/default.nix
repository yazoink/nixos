{
  osConfig,
  config,
  lib,
  ...
}: let
  confFile = config.lib.stylix.colors {
    template = ./hyprlock-colors.conf.mustache;
    extension = "conf";
  };
in {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprlock.enable {
    xdg.configFile = {
      # "hypr/hyprlock-colors.conf".source = confFile;
      "hypr/hyprlock.conf".text = ''
        source = ${confFile}

        $font = ${config.stylix.fonts.sansSerif.name}
        $radius = 10

        general {
          hide_cursor = false
          grace = 0
        }

        background {
          monitor =
          color = $bg0
          path = screenshot
          blur_size = 2
          vibrancy = 0
          brightness = 0.7
          blur_passes = 4
        }

        # ----- Base ----- #

        shape {
          monitor =
          size = 170, 170
          position = 0, 132
          border_size = 1
          border_color = $border
          color = $bg0
          rounding = -1
        }

        shape {
          monitor =
          size = 550, 300
          rounding = 15
          border_size = 1
          border_color = $border
          color = $bg0
          halign = center
          valign = center
        }

        shape {
          monitor =
          size = 170, 170
          position = 0, 132
          border_size = 0
          color = $bg0
          rounding = -1
        }

        # ----- MPD ----- #

        #label {
        #  monitor =
        #  color = $fg
        #  text = cmd[update:5000] ${./bottom_text.sh}
        #  font_family = $font
        #  halign = center
        #  valign = center
        #  position = 0, -180
        #  font_size = 12
        #}

        # ----- Input Field ----- #

        input-field {
          monitor =
          size = 470, 50
          outline_thickness = 0
          rounding = 10
          inner_color = $bg1
          check_color = rgb(d9bc8c)
          fail_color = rgb(b66467)
          font_color = $fg
          fade_on_empty = false
          placeholder_text = enter password...
          fail_text = authentication failed!
          swap_font_color = true
          halign = center
          valign = center
          font_family = Rubik
          position = 0, -87
        }

        # ----- Date / Time ----- #

        label {
          monitor =
          text = <b>$TIME12</b>
          color = $fg
          font_family = $font
          halign = center
          valign = center
          position = 0, 20
          font_size = 42
        }

        label {
          monitor =
          text = cmd[] date "+%d %b %Y"
          color = $fg
          font_family = $font
          halign = center
          valign = center
          font_size = 16
          position = 0, -27
        }

        # ----- Profile Image ----- #

        image {
          monitor =
          path = ${./profile_image.jpg}
          size = 135
          rounding = -1
          position = 0, 132
          border_size = 1
          border_color = $border
        }
      '';
    };
  };
}
