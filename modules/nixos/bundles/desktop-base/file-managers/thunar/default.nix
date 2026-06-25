{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [file-roller];
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
    xfconf.enable = true;
  };

  services = {
    gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };
    tumbler.enable = true;
  };
}
