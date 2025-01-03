{pkgs, config, lib, osConfig, ...}:
let
  inherit (osConfig.myOptions.bundles.desktopBase) windowManager;
  script = ./script.sh;
  simpleLogout = pkgs.callPackage ./simple-logout.nix {};
  styleCss = config.lib.stylix.colors {
    template = ./config/${windowManager}.css.mustache;
    extension = ".css";
  };
in
{
  options = {
    bundles.desktopBase.simpleLogout.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.simpleLogout.enable {
    utils.replacecolor.enable = true;
    home = {
      packages = [simpleLogout];
      file = {
        #".config/simple-logout/icons".source = ./config/icons/${osConfig.myOptions.desktopTheme.name};
        ".config/simple-logout/config.json".source = ./config/${windowManager}.json;
        ".config/simple-logout/style.css".source = styleCss;
      };
    };
    systemd.user.services.replacecolor = {
      Unit.Description = "Replace the color of the simple-logout icons";
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.bash}/bin/bash ${script} ${config.utils.replacecolor.package}/bin/replacecolor ${./config/icons} #${config.stylix.base16Scheme.base05} ${osConfig.myOptions.userAccount.username}";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
