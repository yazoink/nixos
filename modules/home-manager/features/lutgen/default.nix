{
  pkgs,
  osConfig,
  config,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.features.lutgen.enable {
    home.packages = with pkgs; [lutgen];
    xdg.configFile."lutgen/current".text = with config.stylix.base16Scheme; ''
      ${base00}
      ${base01}
      ${base02}
      ${base03}
      ${base04}
      ${base05}
      ${base06}
      ${base07}
      ${base08}
      ${base09}
      ${base0A}
      ${base0B}
      ${base0C}
      ${base0D}
      ${base0E}
      ${base0F}
    '';
  };
}
