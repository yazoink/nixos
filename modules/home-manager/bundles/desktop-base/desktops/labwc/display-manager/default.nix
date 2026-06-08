{...}: {
  home.file.".zprofile" = {
    text = ''
      if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
        exec labwc
      fi
    '';
    executable = true;
  };
}
