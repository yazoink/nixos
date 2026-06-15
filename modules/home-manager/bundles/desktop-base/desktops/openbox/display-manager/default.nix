{...}: {
  home.file.".xinitrc".text = ''
    exec openbox
  '';
  home.file.".zprofile" = {
    text = ''
      if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
        exec startx
      fi
    '';
    executable = true;
  };
}
