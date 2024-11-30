{config, pkgs, lib, ...}:
{
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
      theme = ./theme.rasi;
    };
    home.file.".config/rofi/image.png".source = ./image.png;
  };
}
