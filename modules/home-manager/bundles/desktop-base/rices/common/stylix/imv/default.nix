{config, ...}: {
  programs.imv = {
    settings.options = {
      background = config.lib.stylix.colors.base00;
    };
  };
}
