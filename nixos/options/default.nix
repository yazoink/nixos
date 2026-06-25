# options for system configuration, defined in ../../hosts/<hostname>/options.nix
{
  imports = [
    ./bundles.nix
    ./default-apps.nix
    ./user-account.nix
    ./desktop-theme.nix
    ./features.nix
    ./hardware-features.nix
  ];
}
