{
  inputs,
  osConfig,
  config,
  ...
}: let
  inherit (osConfig.myOptions.userAccount) username;
in {
  imports = [
    ../modules/home-manager
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeManagerModules.nixcord
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs.home-manager.enable = builtins.trace "home-manager enabled" true;
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "${osConfig.myOptions.defaultApps.webBrowser.command}";
      STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
