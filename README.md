# NixOS
My NixOS desktop configs with home-manager and Hyprland.

## Hosts
- Cyberia: Coreboot ThinkPad T430
- Fluoride: Desktop PC (R5 5600/RX 6600)
- Stardust: Acer TravelMate B113-E netbook

## Software
- WM: Hyprland
- Bar: Waybar
- Launcher: Rofi
- Terminal: Foot
- Editor: Neovim
- Browser: Firefox
- File manager: Thunar/Yazi
- Notifications: Mako
- Display manager: SDDM

## Features
- Consistent theming across GTK/Qt and pretty much everything else
- Auto-generated theme based on the current stylix base16 colorscheme for everything except icons and cursors
- Ability to easily toggle between desktop colorschemes in config
- Customized Firefox with [Betterfox](https://github.com/yokoffing/BetterFox) and toggleable userChrome.css themes
- Declarative Etterna package/installation
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/rebuild/rebuild) for rebuilding the system that notifies you when it's done
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/clean/clean) for cleaning the system that notifies you when it's done
- Custom options for easy toggling of features (see [here](https://github.com/yazoink/nixos/tree/main/options)).

## Documentation
See [documentation.md](./documentation.md)
  
## Screenshots
![20241225_00:29:02_screenshot](https://github.com/user-attachments/assets/23fc2784-b8c4-467d-a732-7113c6eb6fd4)
![20241225_00:27:23_screenshot](https://github.com/user-attachments/assets/c86039fd-67b6-4fb1-b4dd-74d98c1fca3e)
![20241225_00:31:12_screenshot](https://github.com/user-attachments/assets/2f0645cd-12b1-48be-ab03-1aa914c58a25)
(hyprland + caroline theme)

![20241223_23:30:16_screenshot](https://github.com/user-attachments/assets/b66e6148-0f1e-4a5e-aab0-f33099460c2f)
![20241224_02:10:57_screenshot](https://github.com/user-attachments/assets/c9458456-3ac2-4bfb-85e9-53187ee04422)
(hyprland + manuscript theme)

![20250103_01:45:35_screenshot](https://github.com/user-attachments/assets/e5d145b1-8281-40d7-8698-30ea58050555)
![20250103_00:45:12_screenshot](https://github.com/user-attachments/assets/b9fdc966-2bf2-4fb5-98d8-8a1ed1da5a45)
(sway + carob theme)

![embers](https://github.com/user-attachments/assets/7b061e7e-c64a-4054-bab5-e0b46f6521a7)
(sway + embers theme)

![twilight](https://github.com/user-attachments/assets/44132aba-23ee-40c8-86ae-d908f5bc523e)
(sway + twilight theme)

![20250103_14:44:29_screenshot](https://github.com/user-attachments/assets/f510d75f-528b-4f19-8a3a-bf155aa5cc5e)
(sddm + caroline theme)
