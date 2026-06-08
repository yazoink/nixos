{
  config,
  osConfig,
  lib,
  ...
}: let
  inherit (config.stylix) base16Scheme;
  margin = 5;
  marginBottom = margin + 48;
in {
  /*
      services.walker = {
      enable = true;
      systemd.enable = true;
      # systemd.enable = true;
  };
  */
  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      theme = "my-theme";
      shell = {
        anchor_top = false;
        anchor_bottom = true;
        anchor_left = true;
        anchor_right = false;
      };
      placeholders.default = {
        input = "Search";
        list = "No Results";
        providers.prefixes = [
          {
            provider = "websearch";
            prefix = "+";
          }
          {
            provider = "providerlist";
            prefix = "_";
          }
        ];
      };
    };
    themes = {
      "my-theme" = {
        style = ''
          @define-color foreground #${base16Scheme.base05};
          @define-color background #${base16Scheme.base00};
          @define-color color1 #${base16Scheme.base01};
          @define-color color2 #${base16Scheme.base04};
          @define-color border #${base16Scheme.base02};

          * {
            all: unset;
          }

          .box-wrapper {
            background-color: @background;
            padding: 20px;
            border: 1px solid @border;
            border-radius: 15px;
            color: @foreground;
            margin-bottom: ${builtins.toString marginBottom}px;
            margin-left: ${builtins.toString margin}px;
          }

          .box {
            border-radius: 15px;
            border: none;
          }

          .input {
            caret-color: @foreground;
            background: @color1;
            padding: 10px;
            border-radius: 10px;
          }

          .input placeholder {
            color: @color2;
          }

          .list {
            color: @foreground;
          }

          .item-box {
            border-radius: 10px;
            padding: 10px;
          }

          child:hover .item-box,
          child:selected .item-box {
            background: @color1;
          }

          .item-subtext {
            font-size: 12px;
            opacity: 0.5;
          }

          .item-image,
          .item-image-text {
            margin-right: 10px;
          }

          .item-quick-activation {
            margin-left: 10px;
            background: @border;
            border-radius: 5px;
            padding: 10px;
          }

          .placeholder,
          .elephant-hint {
            color: @color2;
          }

          .keybinds-wrapper {
            border-top: 1px solid @border;
            color: @color2;
          }

          .keybind-bind {
            font-weight: bold;
            text-transform: lowercase;
          }

          /*scrollbar {
            opacity: 0;
          }*/
        '';
        /*
          layouts = {
          "layout" = ''
            <?xml version="1.0" encoding="UTF-8"?>
            <interface>
              <requires lib="gtk" version="4.0"></requires>
              <object class="GtkWindow" id="Window">
                <style>
                  <class name="window"></class>
                </style>
                <property name="resizable">true</property>
                <property name="title">Walker</property>
                <child>
                  <object class="GtkBox" id="BoxWrapper">
                    <style>
                      <class name="box-wrapper"></class>
                    </style>
                    <property name="orientation">horizontal</property>
                    <property name="valign">bottom</property>
                    <property name="halign">left</property>
                    <property name="width-request">400</property>
                    <property name="height-request">300</property>
                    <!-- Content here -->
                  </object>
                </child>
              </object>
            </interface>
          '';
        };
        */
      };
    };
  };
  /*
    xdg.configFile = {
    "walker/config.toml".source = ./config.toml;
    "walker/themes/my-theme.toml".text = ''
      [ui.anchors]
      bottom = true
      left = true
      right = false
      top = false

      [ui.window]
      h_align = "fill"
      v_align = "fill"

      [ui.window.box]
      h_align = "center"
      width = 450

      [ui.window.box.bar]
      orientation = "horizontal"
      position = "end"

      [ui.window.box.bar.entry]
      h_align = "fill"
      h_expand = true

      [ui.window.box.bar.entry.icon]
      h_align = "center"
      h_expand = true
      pixel_size = 24
      theme = ""

      [ui.window.box.margins]
      top = 200

      [ui.window.box.ai_scroll]
      name = "aiScroll"
      h_align = "fill"
      v_align = "fill"
      max_height = 300
      min_width = 400
      height = 300
      width = 400

      [ui.window.box.ai_scroll.margins]
      top = 8

      [ui.window.box.ai_scroll.list]
      name = "aiList"
      orientation = "vertical"
      width = 400
      spacing = 10

      [ui.window.box.ai_scroll.list.item]
      name = "aiItem"
      h_align = "fill"
      v_align = "fill"
      x_align = 0
      y_align = 0
      wrap = true

      [ui.window.box.scroll.list]
      marker_color = "#${base16Scheme.${osConfig.desktopTheme.base16Accent}}"
      max_height = 300
      max_width = 400
      min_width = 400
      width = 400

      [ui.window.box.scroll.list.item.activation_label]
      h_align = "fill"
      v_align = "fill"
      width = 20
      x_align = 0.5
      y_align = 0.5

      [ui.window.box.scroll.list.item.icon]
      pixel_size = 26
      theme = ""

      [ui.window.box.scroll.list.margins]
      top = 8

      [ui.window.box.search.prompt]
      name = "prompt"
      icon = "edit-find"
      theme = ""
      pixel_size = 18
      h_align = "center"
      v_align = "center"

      [ui.window.box.search.clear]
      name = "clear"
      icon = "edit-clear"
      theme = ""
      pixel_size = 18
      h_align = "center"
      v_align = "center"

      [ui.window.box.search.input]
      h_align = "fill"
      h_expand = true
      icons = true

      [ui.window.box.search.spinner]
      hide = true
    '';
  };
  */
}
