{
  bind = [
    "$mainMod, Q, killactive,"
    "$mainMod SHIFT, E, exit,"
    "$mainMod, X, pin,"
    "$mainMod, M, fullscreen, 1"
    "$mainMod, F, togglefloating,"
    "$mainMod SHIFT, M, fullscreen, 0"
    "$mainMod ALT, left, layoutmsg, focus left"
    "$mainMod ALT, right, layoutmsg, focus right"
    "$mainMod ALT, down, layoutmsg, focus center"
    "$mainMod CTRL, SPACE, layoutmsg, fit all"
    #"$mainMod SHIFT, SPACE, layoutmsg, expel"
    #"$mainMod ALT, SPACE, layoutmsg, consume"
    #"$mainMod, SPACE, layoutmsg, promote"
    "$mainMod SHIFT, X, layoutmsg, inhibit_scroll"
    "$mainMod CTRL, F, layoutmsg, fit all"
    "$mainMod ALT, F, layoutmsg, fit visible"

    # old layout
    #"$mainMod SHIFT, P, pseudo,"
    #"$mainMod, V, togglesplit,"

    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, down, movefocus, d"
    "$mainMod, up, movefocus, u"

    "$mainMod SHIFT, left, movewindow, l"
    "$mainMod SHIFT, right, movewindow, r"
    "$mainMod SHIFT, down, movewindow, d"
    "$mainMod SHIFT, up, movewindow, u"
  ];
  binde = [
    # old layout
    #"$mainMod, Minus, splitratio, -0.1"
    #"$mainMod, Equal, splitratio, 0.1"
    "$mainMod, Minus, resizeactive, -20 0"
    "$mainMod SHIFT, Minus, resizeactive, 0 -20"
    "$mainMod, Equal, resizeactive, 20 0"
    "$mainMod SHIFT, Equal, resizeactive, 0 20"
  ];
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
