{pkgs, config, lib, osConfig, ...}:
let
  script = ./script.sh;
  simpleLogout = pkgs.callPackage ./simple-logout.nix {};
  replacecolor = pkgs.callPackage ./replacecolor.nix {};
  styleCss = config.lib.stylix.colors {
    template = ./config/style.css.mustache;
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
    home = {
      packages = [simpleLogout];
      file = {
        #".config/simple-logout/icons".source = ./config/icons/${osConfig.myOptions.desktopTheme.name};
        ".config/simple-logout/config.json".source = ./config/config.json;
        ".config/simple-logout/style.css".source = styleCss;
      };
    };
    systemd.user.services.replacecolor = {
      Unit.Description = "Replace the color of the simple-logout icons";
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.bash}/bin/bash ${script} ${replacecolor}/bin/replacecolor ${./config/icons} #${config.stylix.base16Scheme.base05} ${osConfig.myOptions.userAccount.username}";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
