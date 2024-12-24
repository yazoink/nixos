{pkgs, config, lib, osConfig, ...}:
{
  options = {
    bundles.desktopFull.ncmpcpp.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.ncmpcpp.enable {
    programs.ncmpcpp = {
      enable = true;
      package = pkgs.ncmpcpp.override {visualizerSupport = true;};
      mpdMusicDir = "/home/${osConfig.myOptions.userAccount.username}/mu";

      bindings = [
        {key = "j"; command = "scroll_down";}
        {key = "k"; command = "scroll_up";}
        {key = "J"; command = ["select_item" "scroll_down"];}
        {key = "K"; command = ["select_item" "scroll_up"];}
      ];

      settings = {
        mpd_crossfade_time = "1";

        visualizer_data_source = "/tmp/mpd.fifo";
        visualizer_output_name = "my_fifo";
        visualizer_in_stereo = "yes";
        visualizer_type = "ellipse";
        visualizer_look = "+|"; 
        progressbar_look = "░█ ";

        system_encoding = "utf-8";
        playlist_disable_highlight_delay = "5";

        browser_display_mode = "columns";
        search_engine_display_mode = "columns";
        playlist_editor_display_mode = "columns";
        autocenter_mode = "yes";
        centered_cursor = "yes";
        user_interface = "alternative";
        follow_now_playing_lyrics = "yes";
        locked_screen_width_part = "60";
        display_bitrate = "yes";
        use_console_editor = "yes";
        header_window_color = "blue";
        volume_color = "magenta";
        state_line_color = "yellow";
        state_flags_color = "magenta";
        progressbar_color = "yellow";
        statusbar_color = "blue";
        external_editor = "nvim";
        empty_tag_marker=" -- ‼ -- ";
        alternative_ui_separator_color = "white";

        lyrics_fetchers = "musixmatch";
      };
    };
  };
}
