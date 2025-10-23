{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme;
in {
  options = {
    bundles.desktopBase.eww.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.eww.enable {
    home.packages = with pkgs; [eww font-awesome];
    xdg.configFile = {
      widgets.source = ./config;
    };
    /*
      xdg.configFile = {
      "widgets/images".source = ./config/images;
      "widgets/widgets".source = ./config/widgets;
      "widgets/windows".source = ./config/windows;
      "widgets/eww.yuck".source = ./config/eww.yuck;
      "widgets/scripts/get_name.sh".source = ./config/scripts/get_name.sh;
      "widgets/scripts/get_os.sh".source = ./config/scripts/get_os.sh;
      "widgets/scripts/lock.sh".source = ./config/scripts/lock.sh;
      "widgets/scripts/confirm-prompt.sh".text =
        ''
          #!/usr/bin/env bash

          config="/home/${osConfig.myOptions.userAccount.username}/.config/widgets"
        ''
        + builtins.readFile ./config/scripts/confirm.sh;
      "widgets/close-power-menu.sh".text =
        ''
          #!/usr/bin/env bash

          config="/home/${osConfig.myOptions.userAccount.username}/.config/widgets"
        ''
        + builtins.readFile ./config/close-power-menu.sh;
      "widgets/launch-corners.sh".text =
        ''
          #!/usr/bin/env bash

          config="/home/${osConfig.myOptions.userAccount.username}/.config/widgets"
        ''
        + builtins.readFile ./config/launch-corners.sh;
      "widgets/monitor-attached.sh" = {
        text =
          ''
            #!/usr/bin/env bash

            config="/home/${osConfig.myOptions.userAccount.username}/.config/widgets"
          ''
          + builtins.readFile ./config/monitor-attached.sh;
        executable = true;
      };
      "widgets/launch-power-menu.sh".text =
        ''
          #!/usr/bin/env bash

          config="/home/${osConfig.myOptions.userAccount.username}/.config/widgets"
        ''
        + builtins.readFile ./config/launch-power-menu.sh;
      "widgets/eww.scss".text =
        ''
          $border: #${base16Scheme.base01};
          $bg: #${base16Scheme.base00};
          $bg2: #${base16Scheme.base02};
          $bg3: #${base16Scheme.base03};
          $fg: #${base16Scheme.base05};
          $red: #${base16Scheme.base08};
          $yellow: #${base16Scheme.base0A};
          $green: #${base16Scheme.base0B};
          $blue: #${base16Scheme.base0D};
          $purple: #${base16Scheme.base0E};
        ''
        + builtins.readFile ./config/eww.scss;
    };
    */
  };
}
