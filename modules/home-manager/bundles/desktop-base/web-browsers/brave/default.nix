{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      {id = "fnaicdffflnofjppbagibeoednhnbjhg";} # floccus
      {id = "kpmjjdhbcfebfjgdnpjagcndoelnidfj";} # control panel for twitter
      {id = "jinjaccalgkegednnccohejagnlnfdag";} # violentmonkey
      {id = "njdfdhgcmkocbgbhcioffdbicglldapd";} # localcdn
      {id = "lckanjgmijmafbedllaakclkaicjfmnk";} # clearurls
    ];
    dictionaries = [
      pkgs.hunspellDictsChromium.en_US
    ];
    commandLineArgs = [
      "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      # "--disable-features=WebRtcAllowInputVolumeAdjustment"
    ];
  };
}
