{
  osConfig,
  lib,
  ...
}:
let
  inherit (osConfig.myOptions.userAccount) username;
in
lib.mkIf (osConfig.networking.hostName == "cyberia") {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
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
