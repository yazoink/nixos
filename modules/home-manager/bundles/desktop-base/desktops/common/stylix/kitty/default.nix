{config, ...}: {
  programs.kitty.settings = {
    text_composition_strategy =
      if (config.stylix.polarity == "light")
      then "legacy"
      else "platform";
  };
}
