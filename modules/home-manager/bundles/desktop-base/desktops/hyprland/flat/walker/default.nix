{
  config,
  osConfig,
  lib,
  ...
}: let
  inherit (config.stylix) base16Scheme;
  margin = 5;
  marginBottom = margin + 42;
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
      };
    };
  };
}
