{
  inputs,
  osConfig,
  config,
  ...
}: let
  inherit (osConfig.myOptions.userAccount) username;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeManagerModules.nixcord
    ../modules/home-manager
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

  system.activationScripts = {
    text = ''
      echo "base00: ${config.stylix.base16Scheme.base00}"
      echo "base01: ${config.stylix.base16Scheme.base01}"
      echo "base02: ${config.stylix.base16Scheme.base02}"
      echo "base03: ${config.stylix.base16Scheme.base03}"
      echo "base04: ${config.stylix.base16Scheme.base04}"
      echo "base05: ${config.stylix.base16Scheme.base05}"
      echo "base06: ${config.stylix.base16Scheme.base06}"
      echo "base07: ${config.stylix.base16Scheme.base07}"
      echo "base08: ${config.stylix.base16Scheme.base08}"
      echo "base09: ${config.stylix.base16Scheme.base09}"
      echo "base0A: ${config.stylix.base16Scheme.base0A}"
      echo "base0B: ${config.stylix.base16Scheme.base0B}"
      echo "base0C: ${config.stylix.base16Scheme.base0C}"
      echo "base0D: ${config.stylix.base16Scheme.base0D}"
      echo "base0E: ${config.stylix.base16Scheme.base0E}"
      echo "base0F: ${config.stylix.base16Scheme.base0F}"
    '';
    deps = with config.stylix.base16Scheme; [
      base00
      base01
      base02
      base03
      base04
      base05
      base06
      base07
      base08
      base09
      base0A
      base0B
      base0C
      base0D
      base0E
      base0F
    ];
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
