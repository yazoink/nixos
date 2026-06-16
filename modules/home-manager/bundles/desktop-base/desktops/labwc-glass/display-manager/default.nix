{...}: {
  home.file.".zprofile" = {
    text = ''
      if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
        exec dbus-run-session labwc
      fi
    '';
    executable = true;
  };
}
