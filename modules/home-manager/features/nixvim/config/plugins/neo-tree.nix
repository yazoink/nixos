{
  neo-tree = {
    enable = true;
    enableDiagnostics = true;
    enableGitStatus = true;
    enableModifiedMarkers = true;
    enableRefreshOnWrite = true;
    closeIfLastWindow = true;
    popupBorderStyle = "single"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
    buffers = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
      };
    };
    extraOptions = {
      filesystem = {
        filtered_items = {
          visible = true;
        };
      };
    };
    window = {
      width = 40;
      height = 15;
      autoExpandWidth = false;
      #mappings = {
      #  "<space>" = "none";
      #};
    };
  };
}
