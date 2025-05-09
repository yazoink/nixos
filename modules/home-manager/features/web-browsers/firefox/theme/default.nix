{
  osConfig,
  config,
  ...
}: let
  userChrome = config.lib.stylix.colors {
    template = ./userChrome.css.mustache;
    extension = ".css";
  };
in {
  stylix.targets.firefox = {
    enable = false;
    profileNames = [osConfig.myOptions.userAccount.username];
  };
  home.file = {
    ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userChrome.css".source = userChrome;
  };
}
