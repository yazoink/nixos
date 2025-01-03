{
  osConfig,
  lib,
  ...
}:
lib.mkIf (osConfig.networking.hostName == "stardust") {
  home = {
    username = "${osConfig.myOptions.userAccount.username}";
    homeDirectory = "/home/${osConfig.myOptions.userAccount.username}";
    sessionVariables = {
      EDITOR = "nvim";
      #STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
      BROWSER = "${osConfig.myOptions.defaultApps.webBrowser.command}";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
