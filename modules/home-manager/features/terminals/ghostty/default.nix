{config, lib, osConfig, pkgs, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.terminal.command == "ghostty") {
    home.packages = [pkgs.ghostty];
    xdg.configFile."ghostty/config".text = with config.stylix; ''
      cursor-style = bar
      cursor-style-blink = true
      clipboard-read = allow
      clipboard-write = allow
      shell-integration-features = cursor,sudo,title

      # Font settings
      font-family = ${fonts.monospace.name}
      font-family = Terminus
      font-size = ${builtins.toString fonts.sizes.terminal}

      # Base colors
      background = ${base16Scheme.base00}
      foreground = ${base16Scheme.base05}

      # Color palette
      palette = 0=#${base16Scheme.base00}
      palette = 1=#${base16Scheme.base08}
      palette = 2=#${base16Scheme.base0B}
      palette = 3=#${base16Scheme.base0A}
      palette = 4=#${base16Scheme.base0D}
      palette = 5=#${base16Scheme.base0E}
      palette = 6=#${base16Scheme.base0C}
      palette = 7=#${base16Scheme.base05}
      palette = 8=#${base16Scheme.base03}
      palette = 9=#${base16Scheme.base08}
      palette = 10=#${base16Scheme.base0B}
      palette = 11=#${base16Scheme.base0A}
      palette = 12=#${base16Scheme.base0D}
      palette = 13=#${base16Scheme.base0E}
      palette = 14=#${base16Scheme.base0C}
      palette = 15=#${base16Scheme.base07}

      # Additional base16 colors
      palette = 16=#${base16Scheme.base09}
      palette = 17=#${base16Scheme.base0F}
      palette = 18=#${base16Scheme.base01}
      palette = 19=#${base16Scheme.base02}
      palette = 20=#${base16Scheme.base04}
      palette = 21=#${base16Scheme.base06}

      # Cursor colors
      cursor-color = ${base16Scheme.base05}
      cursor-text = ${base16Scheme.base00}

      # Selection colors
      selection-background = ${base16Scheme.base02}
      selection-foreground = ${base16Scheme.base05}
    '';
  };
}
