# NixOS
My NixOS desktop configs with home-manager.

## Hosts
- Cyberia: Coreboot ThinkPad T430
- Fluoride: Desktop PC (R5 5600/RX 6600)
- Stardust: Acer TravelMate B113-E netbook

## Software
- WM: Hyprland/SwayFX
- Bar: Ironbar/Waybar
- Launcher: Rofi/Wofi/Anyrun
- Terminal: Foot/Alacritty/Kitty
- Editor: Neovim
- Browser: Firefox/Zen/Brave/Librewolf
- File manager: Thunar/Yazi
- Notifications: Mako/SwayNC
- Display manager: SDDM/ReGreet
- Lockscreen: Hyprlock/Gtklock
- Shell: Zsh
- Prompt: Starship

## Features
- Consistent theming across Gtk/Qt and pretty much everything else
- Auto-generated theme based on the current stylix base16 colorscheme for everything except icons and cursors
- Ability to easily toggle between desktop colorschemes in config
- Declarative Etterna package/installation (works sometimes)
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/rebuild/rebuild) for rebuilding the system that notifies you when it's done
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/clean/clean) for cleaning the system that notifies you when it's done
- Various other [useful scripts](https://github.com/yazoink/nixos/tree/main/modules/home-manager/features/shell-config/scripts)
- Custom options for easy toggling of features (see [here](https://github.com/yazoink/nixos/tree/main/options/default.nix)).

## Documentation
See [documentation.md](./documentation.md)
  
## Rice Previews

https://github.com/user-attachments/assets/41fcada3-c4fb-411e-8e20-1d622d035aed

![20250511_18:47:47_screenshot](https://github.com/user-attachments/assets/3f351d0f-727d-484d-8db7-84e05ca302bb)

![20250511_21:44:11_screenshot](https://github.com/user-attachments/assets/3f02f5a7-f79f-4269-8ce2-12d046388b25)

![hyprlock](https://github.com/user-attachments/assets/22db2890-6042-41ef-9415-53587d89efda)

![20250511_18:04:18_screenshot](https://github.com/user-attachments/assets/6f251a93-6b47-4331-92c8-72c28c9558de)
