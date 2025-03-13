{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "brave") {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      ];
      dictionaries = [
        pkgs.hunspellDictsChromium.en_US
      ];
      commandLineArgs = [
        # "--disable-features=WebRtcAllowInputVolumeAdjustment"
      ];
    };
  };
}
