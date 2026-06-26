{osConfig, ...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "apple";
      };
      modules = [
        {
          type = "break";
        }
        {
          type = "break";
        }
        {
          type = "title";
        }
        {
          type = "break";
        }
        {
          type = "os";
        }
        {
          type = "kernel";
        }
        {
          type = "host";
        }
        {
          type = "shell";
        }
        {
          type = "wm";
        }
        {
          type = "terminal";
        }
        {
          type = "cpu";
        }
        {
          type =
            if (osConfig.networking.hostName == "stardust")
            then "gpu"
            else "display";
        }
        {
          type = "memory";
        }
        {
          type = "swap";
        }
        {
          type = "break";
        }
        {
          type = "colors";
        }
      ];
    };
  };
}
