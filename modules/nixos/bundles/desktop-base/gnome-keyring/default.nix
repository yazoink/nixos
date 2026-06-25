{
  pkgs,
  config,
  lib,
  ...
}: {
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [seahorse];
}
