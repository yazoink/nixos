{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopFull.syncthing.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.syncthing.enable {
    services.syncthing = {
      enable = true;
      user = config.myOptions.userAccount.username;
      group = "users";
      openDefaultPorts = true;
      dataDir = "/home/${config.myOptions.userAccount.username}"; # Default folder for new synced folders
      guiAddress = "127.0.0.1:8384"; # Folder for Syncthing's settings and keys
      overrideDevices = true; # overrides any devices added or deleted through the WebUI
      overrideFolders = true; # overrides any folders added or deleted through the WebUI
      settings = {
        folders = {
          "uni" = {
            path = "/home/${config.myOptions.userAccount.username}/uni";
          };
          "music" = {
            path = "/home/${config.myOptions.userAccount.username}/mu";
          };
        };
      };
    };
  };
}
