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
  home.packages = with pkgs; [eww font-awesome jq curl lm_sensors];
  xdg.configFile = {
    "eww" = {
      source = ./config;
      recursive = true;
      force = true;
    };
    "eww/widgets/monitor.yuck".text = ''
      (defpoll cpu :run-while monitor_visible :interval "17s" "bash ./scripts/cpu.sh")
      (defpoll temp :run-while monitor_visible :interval "17s"  `${tempCmd}`)

      (defwidget monitor []
        (revealer
          :transition "slideup"
          :reveal monitor_visible
          (box
            :class "monitor-box"
            :orientation "v"
            :spacing 8
            (box
              :orientation "h"
              :space-evenly true
              :spacing 8
              (box
                :class "monitor-item cpu base08"
                (label :text "" :class "icon")
                (label :text "${dollarSign}{round(cpu, 0)}%" :class "usage")
              )
              (box
                :class "monitor-item ram base0A"
                (label :text "" :class "icon")
                (label :text "${dollarSign}{round(EWW_RAM.used_mem_perc, 0)}%" :class "usage")
              )
            )
            (box
              :orientation "h"
              :space-evenly true
              :spacing 8
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
      )
    '';
    "eww/widgets/launchers.yuck".text = with defaultApps; ''
      (defvar dnd false)
      (defpoll dnd_icon :run-while control_panel_visible :interval "17s"  "bash ./scripts/dnd_icon.sh")

      (defwidget app-button [name desc icon launch]
        (button
          :class "app-button"
          :onclick "${dollarSign}{launch}"
          :tooltip "Open ${dollarSign}{name}"
          (box
            :class "app-button-box"
            :orientation "horizontal"
            :halign "fill"
            :space-evenly false
            :spacing 8
            (image :icon "${dollarSign}{icon}" :icon-size "dialog" :class "icon")
            (box
              :class "name-desc"
              :orientation "vertical"
              :space-evenly false
              :valign "center"
              :halign "start"
              :hexpand true
              (label :text "${dollarSign}{name}" :class "name" :halign "start")
              (label :text "${dollarSign}{desc}" :class "desc" :halign "start")
            )
            (label :text "" :halign "end" :class "arrow")
          )
        )
      )

      (defwidget apps []
        (box
          :class "apps-box"
          :orientation "vertical"
          :halign "start"
          :valign "start"
          :spacing 8
          :space-evenly false
          :halign "fill"
          :valign "fill"
          :vexpand true
          :hexpand true
          (box
            :orientation "h"
            :space-evenly false
            :spacing 8
            :halign "start"
            :class "apps-label"
            (label :text "" :class "base0A" )
            (label :text "Quick Access")
          )
          (box :class "hline")
          (app-button
            :name "Web Browser"
            :desc "${defaultApps.webBrowser}"
            :icon "web-browser"
            :launch "bash ./scripts/launch_app.sh ${defaultApps.webBrowser} &"
          )
          (app-button
            :name "File Manager"
            :desc "${defaultApps.fileManager}"
            :icon "folder"
            :launch "bash ./scripts/launch_app.sh \"${defaultApps.fileManager} $HOME\" &"
          )
          (app-button
            :name "Terminal"
            :desc "${defaultApps.terminal}"
            :icon "terminal"
            :launch "bash ./scripts/launch_app.sh \"${defaultApps.terminal} -D $HOME\" &"
          )
          (app-button
            :name "Office Suite"
            :desc "libreoffice"
            :icon "libreoffice"
            :launch "bash ./scripts/launch_app.sh libreoffice &"
          )
        )
      )

      (defwidget launchers []
        (box
          :orientation "v"
          :class "launchers-box"
          :space-evenly false
          (box
            :orientation "v"
            :valign "start"
            :spacing 8
            :space-evenly false
            :vexpand true
            (button
              :class "launcher-button search"
              :onclick "bash ./scripts/launch_app.sh 'wofi --show drun' &"
              :tooltip "Search applications"
              (label :text "" :class "icon")
            )
            (button
              :class "launcher-button picker"
              :onclick "bash ./scripts/launch_app.sh hyprpicker &"
              :tooltip "Open colour picker"
              (label :text "" :class "icon")
            )
            (button
              :class "launcher-button shot"
              :onclick "bash ./scripts/launch_app.sh 'screenshot -s' &"
              :tooltip "Take screenshot"
              (label :text "" :class "icon")
            )
          )
          (box
            :orientation "v"
            :valign "end"
            :spacing 8
            :space-evenly true
            :vexpand true
            (button
              :class "launcher-button dnd"
              :tooltip "Toggle do-not-disturb"
              :onclick "bash ./scripts/dnd.sh &"
              (label :text dnd_icon :class "icon")
            )
            (button
              :class "launcher-button shutdown"
              :tooltip "Open power menu"
              :onclick "bash ./scripts/launch_app.sh 'eww update power_visible=true' &"
              (label :text "" :class "icon")
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
