{config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.virtualbox.enable {
    virtualisation.virtualbox = {
      host = {
        enable = true;
        #enableExtensionPack = true;
      };
    };
  };
}
