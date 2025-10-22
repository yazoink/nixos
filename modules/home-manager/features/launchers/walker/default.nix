{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (config.stylix) base16Scheme;
in {
  options = {
    bundles.desktopBase.walker.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.walker.enable {
    services.walker = {
      enable = true;
      systemd.enable = true;
    };
    xdg.configFile = {
      "walker/config.toml".source = ./config.toml;
      "walker/themes/mytheme.toml".text = ''
        [ui.anchors]
        bottom = true
        left = true
        right = true
        top = true

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
      "walker/themes/mytheme.css".text = ''
        @define-color foreground #${base16Scheme.base05};
        @define-color background #${base16Scheme.base00};
        @define-color color1 #${base16Scheme.base02};
        @define-color border #${base16Scheme.base01};

        #window,
        #box,
        #aiScroll,
        #aiList,
        #search,
        #password,
        #input,
        #prompt,
        #clear,
        #typeahead,
        #list,
        child,
        scrollbar,
        slider,
        #item,
        #text,
        #label,
        #bar,
        #sub,
        #activationlabel {
          all: unset;
        }

        #cfgerr {
          background: @background;
          margin-top: 20px;
          padding: 5px;
        }

        #window {
          color: @foreground;
        }

        #box {
          border-radius: 15px;
          background: @background;
          padding: 15px;
          border: 1px solid @border;
          box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }

        #search {
          background: none;
          padding: 8px;
          border-radius: 5px;
        }

        #prompt {
          margin-left: 4px;
          margin-right: 12px;
          color: @foreground;
          opacity: 0.2;
          /*font-style: italic;*/
        }

        #clear {
          color: @foreground;
          opacity: 0.8;
        }

        #password,
        #input,
        #typeahead {
          border-radius: 5px;
        }

        #input {
          background: none;
        }

        #password {
        }

        #spinner {
          padding: 8px;
        }

        #typeahead {
          color: @foreground;
          opacity: 0.8;
          font-style: italic;
        }

        #input placeholder {
          opacity: 0.5;
        }

        #list {
        }

        child {
          padding: 5px;
          border-radius: 5px;
        }

        child:selected,
        child:hover {
          background: @color1;
        }

        #item {
        }

        #icon {
          margin-right: 8px;
        }

        #text {
        }

        #label {
          font-weight: bold;
        }

        #sub {
          opacity: 0.5;
          font-size: 11pt;
          /*font-style: italic;*/
        }

        #activationlabel {
        }

        #bar {
        }

        .barentry {
        }

        .activation #activationlabel {
        }

        .activation #text,
        .activation #icon,
        .activation #search {
          opacity: 0.5;
        }

        .aiItem {
          padding: 5px;
          border-radius: 5px;
          color: @foreground;
          background: @background;
        }

        .aiItem.user {
          padding-left: 0;
          padding-right: 0;
        }

        .aiItem.assistant {
          background: @color1;
        }
      '';
    };
  };
}
