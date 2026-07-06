{
  pkgs,
  config,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  inherit (osConfig.myOptions) defaultApps;
  dollarSign = "$";
  tempCmd =
    if (osConfig.networking.hostName == "stardust")
    then "sensors | grep Tctl | awk '{print $2}' | sed 's/\\+//g;s/\\.[0-9]°C//g'"
    else "sensors | grep 'Core 0' | awk '{print $3}' | sed 's/\\+//g;s/\\.[0-9]°C//g'";
in {
  home.packages = with pkgs; [
    eww
    font-awesome
    jq
    curl
    lm_sensors
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        pygobject3
      ]))
  ];
  xdg.configFile = {
    "eww" = {
      source = ./config;
      recursive = true;
      force = true;
    };
    "eww/control_center/widgets/monitor.yuck".text = ''
      (defpoll cpu :run-while monitor_visible :interval "17s" "bash ./scripts/cpu.sh")
      (defpoll temp :run-while monitor_visible :interval "17s"  `${tempCmd}`)

      (defwidget monitor []
        (box
          :class "monitor-box"
          :orientation "v"
          :spacing 8
          :halign "fill"
          :hexpand true
          (box
            :orientation "h"
            :spacing 8
            :halign "center"
            (box
              :class "monitor-item cpu base08"
              (label :text "" :class "icon")
              (label :text "${dollarSign}{cpu}%" :class "usage")
            )
            (box
              :class "monitor-item ram base0A"
              (label :text "" :class "icon")
              (label :text "${dollarSign}{round(EWW_RAM.used_mem_perc, 0)}%" :class "usage")
            )
          )
          (box
            :orientation "h"
            :spacing 8
            :halign "center"
            (box
              :class "monitor-item disk base0B"
              (label :text "" :class "icon")
              (label :text "${dollarSign}{round(EWW_DISK["/"].used_perc, 0)}%" :class "usage")
            )
            (box
              :class "monitor-item temp base0D"
              (label :text "" :class "icon")
              (label :text "${dollarSign}{temp}°C" :class "usage")
            )
          )
        )
      )
    '';
    "eww/_colours.scss".text = with colors; ''
      $base00: #${base00};
      $base01: #${base01};
      $base04: #${base04};
      $base05: #${base05};
      $base08: #${base08};
      $base0A: #${base0A};
      $base0B: #${base0B};
      $base0D: #${base0D};
      $base0E: #${base0E};
      $surface: rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.09);
      $surface-lighter: rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.18);
    '';
  };
}
