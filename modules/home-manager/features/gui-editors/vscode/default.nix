{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.guiTextEditor == "codium") {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      userSettings = {
        "[nix]"."editor.tabSize" = 2;
        "files.autoSave" = "on";
        #"editor.fontSize" = 12;
        #"editor.fontFamily" = lib.mkForce "Terminus \(TTF\)";
        #"editor.fontFamily" = lib.mkForce "0xProto Nerd Font";
      };
      profiles.default.extensions = with pkgs.vscode-extensions; [
        hars.cppsnippets
        ms-vscode.cpptools
        jnoortheen.nix-ide
        ms-python.python
        devsense.phptools-vscode
        ecmel.vscode-html-css
        mads-hartmann.bash-ide-vscode
        ms-python.debugpy
      ];
    };
  };
}
