{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.guiTextEditor.command == "vscode") {
    defaultApps.guiTextEditor.desktopFile = "vscodium.desktop";
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default.userSettings = {
        "[nix]"."editor.tabSize" = 2;
        "files.autoSave" = "on";
        "window.zoomLevel" = 1;
        # "editor.fontSize" = lib.mkForce 12;
      };
      profiles.default.extensions = with pkgs.vscode-extensions; [
        hars.cppsnippets
        ms-vscode.cpptools
        jnoortheen.nix-ide
        ms-python.python
        # devsense.phptools-vscode
        ecmel.vscode-html-css
        mads-hartmann.bash-ide-vscode
        ms-python.debugpy
      ];
    };
  };
}
