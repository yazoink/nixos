{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.features.vscode.enable {
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
