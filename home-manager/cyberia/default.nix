{osConfig, lib, ...}: 
lib.mkIf (osConfig.networking.hostName == "cyberia") {
  home = {
    username = "${osConfig.userAccount.username}";
    homeDirectory = "/home/${osConfig.userAccount.username}";
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "foot";
      BROWSER = "firefox";
      #STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
