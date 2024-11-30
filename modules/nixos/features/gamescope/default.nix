{config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.gamescope.enable {
    programs = {
      gamescope = {
        enable = true;
        capSysNice = true;
      };
    };
  };
}
