{
  osConfig,
  lib,
  ...
}:
lib.mkIf (osConfig.networking.hostName == "tallulah") {
  home = builtins.trace "tallulah home-manager module enabled" {
    username = builtins.trace "tallulah home dir set" "${osConfig.myOptions.userAccount.username}";
    homeDirectory = "/home/${osConfig.myOptions.userAccount.username}";
    sessionVariables = {
      EDITOR = "nvim";
      #STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
      BROWSER = "${osConfig.myOptions.defaultApps.webBrowser.command}";
    };
    stateVersion = "24.05";
  };
}
