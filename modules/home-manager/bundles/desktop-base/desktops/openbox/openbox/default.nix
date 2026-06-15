{osConfig, ...}: {
  home.file.".config/openbox/rc.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <openbox_config xmlns="http://openbox.org/3.4/rc">
      <resistance>
        <strength>10</strength>
        <screen_edge_strength>20</screen_edge_strength>
      </resistance>

      <margins>
        <top>10</top>
        <left>10</left>
        <right>10</right>
        <bottom>10</bottom>
      </margins>

      <focus>
        <focusNew>yes</focusNew>
        <focusLast>yes</focusLast>
        <followMouse>no</followMouse>
        <focusDelay>200</focusDelay>
        <underMouse>no</underMouse>
        <raiseOnFocus>no</raiseOnFocus>
      </focus>

      <placement>
        <policy>Smart</policy>
        <center>no</center>
      </placement>

      <theme>
        <name>my-openbox</name>
        <titleLayout>CIML</titleLayout>
        <keepBorder>yes</keepBorder>
        <animateIconify>yes</animateIconify>
        <font place="ActiveWindow">
          <name>Gabarito</name>
          <size>12</size>
          <weight>bold</weight>
          <slant>normal</slant>
        </font>
        <font place="InactiveWindow">
          <name>Gabarito</name>
          <size>12</size>
          <weight>bold</weight>
          <slant>normal</slant>
        </font>
        <font place="MenuHeader">
          <name>Gabarito</name>
          <size>12</size>
          <weight>normal</weight>
          <slant>normal</slant>
        </font>
        <font place="MenuItem">
          <name>Gabarito</name>
          <size>12</size>
          <weight>normal</weight>
          <slant>normal</slant>
        </font>
        <font place="OnScreenDisplay">
          <name>Gabarito</name>
          <size>12</size>
          <weight>bold</weight>
          <slant>normal</slant>
        </font>
      </theme>

      <desktops>
        <number>5</number>
        <firstdesk>1</firstdesk>
        <popupTime>1000</popupTime>
        <names>
          <name>Desktop 1</name>
          <name>Desktop 2</name>
          <name>Desktop 3</name>
          <name>Desktop 4</name>
          <name>Desktop 5</name>
        </names>
      </desktops>

      <resize>
        <drawContents>no</drawContents>
        <popupShow>Always</popupShow>
        <popupPosition>Fixed</popupPosition>
        <popupFixedposition>
          <x>400</x>
          <y>center</y>
        </popupFixedPosition>
      </resize>

      <keyboard>
        <rebindOnMappingNotify>yes</rebindOnMappingNotify>
        <chainQuitKey>C-g</chainQuitKey>
        <keybind key="W-q">
          <action name="Close"/>
        </keybind>
        <keybind key="A-Escape">
          <action name="Lower"/>
          <action name="FocusToBottom"/>
          <action name="Unfocus"/>
        </keybind>
        <keybind key="W-Return">
          <action name="Execute" command="${osConfig.myOptions.defaultApps.terminal.command}" />
        </keybind>
        <keybind key="W-space">
          <action name="ShowMenu"><menu>client-menu</menu></action>
        <keybind key="W-1">
          <action name="GoToDesktop" to="1" />
        </keybind>
        <keybind key="W-2">
          <action name="GoToDesktop" to="2" />
        </keybind>
        <keybind key="W-3">
          <action name="GoToDesktop" to="3" />
        </keybind>
        <keybind key="W-4">
          <action name="GoToDesktop" to="4" />
        </keybind>
        <keybind key="W-5">
          <action name="GoToDesktop" to="5" />
        </keybind>
        </keybind>
      </keyboard>

      <mouse>
        <dragThreshold>1</dragThreshold>
        <doubleClickTime>500</doubleClickTime>
        <screenEdgeWarpTime>400</screenEdgeWarpTime>
        <screenEdgeWarpMouse>false</screenEdgeWarpMouse>

        <context name="Frame">
          <mousebind button="W-Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
          <mousebind button="W-Left" action="Click">
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="W-Left" action="Drag">
            <action name="Move"/>
          </mousebind>
          <mousebind button="W-Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="W-Right" action="Drag">
            <action name="Resize"/>
          </mousebind>
          <mousebind button="W-Middle" action="Press">
            <action name="Lower"/>
            <action name="FocusToBottom"/>
            <action name="Unfocus"/>
          </mousebind>
          <mousebind button="W-Up" action="Click">
            <action name="GoToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="W-Down" action="Click">
            <action name="GoToDesktop">
              <to>next</to>
            </action>
          </mousebind>
          <mousebind button="C-A-Up" action="Click">
            <action name="GoToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="C-A-Down" action="Click">
            <action name="GoToDesktop">
              <to>next</to>
            </action>
          </mousebind>
          <mousebind button="A-W-Up" action="Click">
            <action name="SendToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="A-W-Down" action="Click">
            <action name="SendToDesktop">
              <to>next</to>
            </action>
          </mousebind>
        </context>

        <context name="Titlebar">
          <mousebind button="Left" action="Drag">
            <action name="Move"/>
          </mousebind>
          <mousebind button="Left" action="DoubleClick">
            <action name="ToggleMaximize"/>
          </mousebind>
          <mousebind button="Up" action="Click">
            <action name="if">
              <shaded>no</shaded>
              <then>
                <action name="Shade"/>
                <action name="FocusToBottom"/>
                <action name="Unfocus"/>
                <action name="Lower"/>
              </then>
            </action>
          </mousebind>
          <mousebind button="Down" action="Click">
            <action name="if">
              <shaded>yes</shaded>
              <then>
                <action name="Unshade"/>
                <action name="Raise"/>
              </then>
            </action>
          </mousebind>
        </context>

        <context name="Titlebar Top Right Bottom Left TLCorner TRCorner BRCorner BLCorner">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="Middle" action="Press">
            <action name="Lower"/>
            <action name="FocusToBottom"/>
            <action name="Unfocus"/>
          </mousebind>
          <mousebind button="Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="ShowMenu">
              <menu>client-menu</menu>
            </action>
          </mousebind>
        </context>

        <context name="Top">
          <mousebind button="Left" action="Drag">
            <action name="Resize">
              <edge>top</edge>
            </action>
          </mousebind>
        </context>

        <context name="Left">
          <mousebind button="Left" action="Drag">
            <action name="Resize">
              <edge>left</edge>
            </action>
          </mousebind>
        </context>

        <context name="Right">
          <mousebind button="Left" action="Drag">
            <action name="Resize">
              <edge>right</edge>
            </action>
          </mousebind>
        </context>

        <context name="Bottom">
          <mousebind button="Left" action="Drag">
            <action name="Resize">
              <edge>bottom</edge>
            </action>
          </mousebind>
          <mousebind button="Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="ShowMenu">
              <menu>client-menu</menu>
            </action>
          </mousebind>
        </context>

        <context name="TRCorner BRCorner TLCorner BLCorner">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="Left" action="Drag">
            <action name="Resize"/>
          </mousebind>
        </context>

        <context name="Client">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
          <mousebind button="Middle" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
          <mousebind button="Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
        </context>

        <context name="Icon">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
            <action name="ShowMenu">
              <menu>client-menu</menu>
            </action>
          </mousebind>
          <mousebind button="Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="ShowMenu">
              <menu>client-menu</menu>
            </action>
          </mousebind>
        </context>

        <context name="AllDesktops">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="Left" action="Click">
            <action name="ToggleOmnipresent"/>
          </mousebind>
        </context>

        <context name="Shade">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
          <mousebind button="Left" action="Click">
            <action name="ToggleShade"/>
          </mousebind>
        </context>

        <context name="Iconify">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
          <mousebind button="Left" action="Click">
            <action name="Iconify"/>
          </mousebind>
        </context>

        <context name="Maximize">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="Middle" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="Left" action="Click">
            <action name="ToggleMaximize"/>
          </mousebind>
          <mousebind button="Middle" action="Click">
            <action name="ToggleMaximize">
              <direction>vertical</direction>
            </action>
          </mousebind>
          <mousebind button="Right" action="Click">
            <action name="ToggleMaximize">
              <direction>horizontal</direction>
            </action>
          </mousebind>
        </context>

        <context name="Close">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </mousebind>
          <mousebind button="Left" action="Click">
            <action name="Close"/>
          </mousebind>
        </context>

        <context name="Desktop">
          <mousebind button="Up" action="Click">
            <action name="GoToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="Down" action="Click">
            <action name="GoToDesktop">
              <to>next</to>
            </action>
          </mousebind>
          <mousebind button="W-Up" action="Click">
            <action name="GoToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="W-Down" action="Click">
            <action name="GoToDesktop">
              <to>next</to>
            </action>
          </mousebind>
          <mousebind button="C-A-Up" action="Click">
            <action name="GoToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="C-A-Down" action="Click">
            <action name="GoToDesktop">
              <to>next</to>
            </action>
          </mousebind>
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
          <mousebind button="Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>
        </context>

        <context name="Root">
          <!-- Menus -->
          <!-- <mousebind button="Middle" action="Press">
            <action name="ShowMenu">
              <menu>client-list-combined-menu</menu>
            </action>
          </mousebind>
          <mousebind button="Right" action="Press">
            <action name="ShowMenu">
              <menu>root-menu</menu>
            </action>
          </mousebind> -->
        </context>

        <context name="MoveResize">
          <mousebind button="Up" action="Click">
            <action name="GoToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="Down" action="Click">
            <action name="GoToDesktop">
              <to>next</to>
            </action>
          </mousebind>
          <mousebind button="A-Up" action="Click">
            <action name="GoToDesktop">
              <to>previous</to>
            </action>
          </mousebind>
          <mousebind button="A-Down" action="Click">
            <action name="GoToDesktop">
              <to>next</to>
            </action>
          </mousebind>
        </context>
      </mouse>
    </openbox_config>
  '';
  home.file.".deletelater".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!-- ### This file was generated with Nix. Don't modify this file directly. -->
    <openbox_config xmlns="http://openbox.org/3.4/rc" xmlns:xi="http://www.w3.org/2001/XInclude">
      <resistance>
        <strength>10</strength>
        <screen_edge_strength>20</screen_edge_strength>
      </resistance>
      <desktops number="5" />
      <focus>
        <followMouse>yes</followMouse>
        <raiseOnFocus>no</raiseOnFocus>
      </focus>
      <keyboard>
        <default />
        <keybind key="W-S-r">
          <action name="Execute" command="labwc -r; notify-send &apos;labwc&apos; &apos;Configuration reloaded&apos;" />
        </keybind>
        <keybind key="W-S-d">
          <action name="ToggleShowDesktop" />
        </keybind>
        <keybind key="A-F4">
          <action name="Close" />
        </keybind>
        <keybind key="W-q">
          <action name="Close" />
        </keybind>
        <keybind key="W-S-m">
          <action name="ToggleFullscreen" />
        </keybind>
        <keybind key="W-m">
          <action name="ToggleMaximize" />
        </keybind>
        <keybind key="W-x">
          <action name="ToggleOmnipresent" />
        </keybind>
        <keybind key="W-f">
          <action name="UnSnap" />
        </keybind>
        <keybind key="W-i">
          <action name="iconify" />
        </keybind>
        <keybind key="W-Tab">
          <action name="NextWindow" identifier="all" output="all" workspace="current" />
        </keybind>
        <keybind key="W-S-Tab">
          <action name="PreviousWindow" identifier="all" output="all" workspace="current" />
        </keybind>
        <keybind key="W-S-Left">
          <action name="ResizeRelative" right="-10" />
        </keybind>
        <keybind key="W-S-Right">
          <action name="ResizeRelative" right="10" />
        </keybind>
        <keybind key="W-S-Up">
          <action name="ResizeRelative" bottom="-10" />
        </keybind>
        <keybind key="W-S-Down">
          <action name="ResizeRelative" bottom="10" />
        </keybind>
        <keybind key="W-Left">
          <action name="MoveRelative" x="-10" />
        </keybind>
        <keybind key="W-Right">
          <action name="MoveRelative" x="10" />
        </keybind>
        <keybind key="W-Up">
          <action name="MoveRelative" y="-10" />
        </keybind>
        <keybind key="W-Down">
          <action name="MoveRelative" y="10" />
        </keybind>
        <keybind key="W-A-Left">
          <action name="ToggleSnapToEdge" combine="yes" direction="left" />
        </keybind>
        <keybind key="W-A-Right">
          <action name="ToggleSnapToEdge" combine="yes" direction="right" />
        </keybind>
        <keybind key="W-A-Up">
          <action name="ToggleSnapToEdge" combine="yes" direction="up" />
        </keybind>
        <keybind key="W-A-Down">
          <action name="ToggleSnapToEdge" combine="yes" direction="down" />
        </keybind>
        <keybind key="W-1">
          <action name="GoToDesktop" to="1" />
        </keybind>
        <keybind key="W-2">
          <action name="GoToDesktop" to="2" />
        </keybind>
        <keybind key="W-3">
          <action name="GoToDesktop" to="3" />
        </keybind>
        <keybind key="W-4">
          <action name="GoToDesktop" to="4" />
        </keybind>
        <keybind key="W-5">
          <action name="GoToDesktop" to="5" />
        </keybind>
        <keybind key="W-S-1">
          <action name="SendToDesktop" to="1" />
        </keybind>
        <keybind key="W-S-2">
          <action name="SendToDesktop" to="2" />
        </keybind>
        <keybind key="W-S-3">
          <action name="SendToDesktop" to="3" />
        </keybind>
        <keybind key="W-S-4">
          <action name="SendToDesktop" to="4" />
        </keybind>
        <keybind key="W-S-5">
          <action name="SendToDesktop" to="5" />
        </keybind>
        <keybind key="W-C-Left">
          <action name="GoToDesktop" to="left" toggle="no" wrap="yes" />
        </keybind>
        <keybind key="W-C-Right">
          <action name="GoToDesktop" to="right" toggle="no" wrap="yes" />
        </keybind>
        <keybind key="W-Return">
          <action name="Execute" command="${osConfig.myOptions.defaultApps.terminal.command}" />
        </keybind>
        <keybind key="W-p">
          <action name="Execute" command="/nix/store/fp416bg9axz9d44d4pi28gd7908llsmj-wofi.sh" />
        </keybind>
        <keybind key="W-r">
          <action name="Execute" command="/nix/store/fp416bg9axz9d44d4pi28gd7908llsmj-wofi.sh" />
        </keybind>
        <keybind key="W-s">
          <action name="Execute" command="bash /nix/store/q225s9pjbch6cccanmrmjc4vifs7xchw-screenshot -s" />
        </keybind>
        <keybind key="W-S-s">
          <action name="Execute" command="bash /nix/store/q225s9pjbch6cccanmrmjc4vifs7xchw-screenshot" />
        </keybind>
        <keybind key="W-C-l">
          <action name="Execute" command="hyprlock" />
        </keybind>
        <keybind key="W-c">
          <action name="Execute" command="/nix/store/l40f15ryvdzj7is59w2bdr67sbqg4cgn-color.sh" />
        </keybind>
        <keybind key="W-w">
          <action name="Execute" command="zen-twilight" />
        </keybind>
        <keybind key="W-e">
          <action name="Execute" command="thunar" />
        </keybind>
        <keybind key="W-S-b">
          <action name="Execute" command="/nix/store/n1jyg824b6ahn9j58iz65i17siw3yc3b-waybar.sh" />
        </keybind>
        <keybind key="W-S-w">
          <action name="Execute" command="/nix/store/61hxgsgps7i47x5y864vwh96bpawrmv1-swaybg.sh -i /nix/store/j0znz86dpfhvb9mjai18gj0sqw6jw354-1751142470750001.jpg -q" />
        </keybind>
        <keybind key="W-S-q">
          <action name="Execute" command="bash $EWW_CONFIG_DIR/launch-power-menu.sh" />
        </keybind>
        <keybind key="W-S-c">
          <action name="Execute" command="bash $EWW_CONFIG_DIR/launch-calendar.sh" />
        </keybind>
        <keybind key="XF86AudioPlay">
          <action name="Execute" command="playerctl play-pause" />
        </keybind>
        <keybind key="XF86AudioPause">
          <action name="Execute" command="playerctl play-pause" />
        </keybind>
        <keybind key="XF86AudioNext">
          <action name="Execute" command="playerctl next" />
        </keybind>
        <keybind key="XF86AudioPrev">
          <action name="Execute" command="playerctl previous" />
        </keybind>
        <keybind key="XF86AudioMute">
          <action name="Execute" command="swayosd-client --output-volume mute-toggle" />
        </keybind>
        <keybind key="XF86AudioMicMute">
          <action name="Execute" command="swayosd-client --input-volume mute-toggle" />
        </keybind>
        <keybind key="XF86AudioRaiseVolume">
          <action name="Execute" command="swayosd-client --output-volume raise" />
        </keybind>
        <keybind key="XF86AudioLowerVolume">
          <action name="Execute" command="swayosd-client --output-volume lower" />
        </keybind>
        <keybind key="W-F12">
          <action name="Execute" command="swayosd-client --output-volume raise" />
        </keybind>
        <keybind key="W-F11">
          <action name="Execute" command="swayosd-client --output-volume lower" />
        </keybind>
        <keybind key="W-F10">
          <action name="Execute" command="swayosd-client --output-volume mute-toggle" />
        </keybind>
        <keybind key="XF86MonBrightnessDown">
          <action name="Execute" command="swayosd-client --brightness lower" />
        </keybind>
        <keybind key="XF86MonBrightnessUp">
          <action name="Execute" command="swayosd-client --brightness raise" />
        </keybind>
        <keybind key="Caps_Lock">
          <action name="Execute" command="swayosd-client --caps-lock" />
        </keybind>
      </keyboard>
      <libinput>
        <device category="touchpad">
          <scrollFactor>1</scrollFactor>
        </device>
      </libinput>
      <theme>
        <cornerRadius>10</cornerRadius>
        <font name="Gabarito" size="12" weight="bold" />
        <icon>Papirus-Paradise-Yellow</icon>
        <name>my-openbox</name>
        <titlebar>
          <dropShadows>yes</dropShadows>
          <dropShadowsOnTiled>yes</dropShadowsOnTiled>
          <layout>close,iconify,max:</layout>
          <showTitle />
        </titlebar>
      </theme>
      <windowSwitcher>
        <osd style="thumbnail" />
      </windowSwitcher>

    </openbox_config>
  '';

  home.file.".local/share/themes/my-openbox/openbox-3/themerc".text = ''
    # general
    border.width: 1

    # padding
    padding.width: 10
    padding.height: 8

    # window border
    window.active.border.color: #232323
    window.inactive.border.color: #232323

    # ToggleKeybinds status indicator
    window.active.indicator.toggled-keybind.color: #B66467

    # window titlebar background
    window.active.title.bg.color: #101010
    window.inactive.title.bg.color: #101010
    window.*.title.bg: Solid

    # Vertical and SplitVertical gradients are supported for window.*.title.bg
    # with the following additional color fields. See labwc-theme(5) for examples.
    #
    #     window.*.title.bg.colorTo:
    #     window.*.title.bg.color.splitTo:
    #     window.*.title.bg.colorTo.splitTo:

    # window titlebar text
    window.active.label.text.color: #E8E3E3
    window.inactive.label.text.color: #868383
    window.label.text.justify: Center

    # window button width and spacing
    window.button.width: 20
    window.button.height: 20
    window.button.spacing: 5

    # window button hover overlay
    window.button.hover.bg.color: #00000000

    # window buttons
    window.active.button.unpressed.image.color: #E8E3E3
    window.inactive.button.unpressed.image.color: #3F3E3E
    window.active.button.disabled.image.color: #868383
    window.inactive.button.disabled.image.color: #868383

    window.active.button.iconify.unpressed.image.color: #D9BC8C
    window.active.button.max.unpressed.image.color: #8C977D
    window.active.button.close.unpressed.image.color: #B66467
    window.active.button.shade.unpressed.image.color: #8DA3B9
    window.active.button.desk.unpressed.image.color: #E8E3E3

    window.active.button.iconify.pressed.image.color: #D9BC8C
    window.active.button.max.pressed.image.color: #8C977D
    window.active.button.close.pressed.image.color: #B66467
    window.active.button.shade.pressed.image.color: #8DA3B9
    window.active.button.desk.pressed.image.color: #E8E3E3

    # window drop-shadows
    window.active.shadow.size: 60
    window.inactive.shadow.size: 40
    window.active.shadow.color: #00000060
    window.inactive.shadow.color: #00000040

    # Note that "menu", "iconify", "max", "close" buttons colors can be defined
    # individually by inserting the type after the button node, for example:
    #
    #     window.active.button.iconify.unpressed.image.color: #333333

    # menu
    menu.overlap.x: 0
    menu.overlap.y: 0
    menu.width.min: 20
    menu.width.max: 200
    menu.border.width: 1
    menu.border.color: #232323
    menu.items.bg.color: #151515
    menu.items.text.color: #E8E3E3
    menu.items.active.bg.color: #232323
    menu.items.active.text.color: #E8E3E3
    menu.items.padding.x: 10
    menu.items.padding.y: 5
    menu.separator.width: 1
    menu.separator.padding.width: 5
    menu.separator.padding.height: 0
    menu.separator.color: #232323
    menu.title.bg.color: #232323
    menu.title.text.color: #E8E3E3
    menu.title.text.justify: Center

    # on screen display (window-cycle dialog)
    osd.bg.color: #151515
    osd.border.color: #232323
    osd.border.width: 1
    osd.label.text.color: #E8E3E3

    # width can be set as percent (of screen width)
    # example 50% or 75% instead of 600, max 100%
    osd.window-switcher.style-classic.width: 600

    osd.window-switcher.style-classic.padding: 5
    osd.window-switcher.style-classic.item.padding.x: 10
    osd.window-switcher.style-classic.item.padding.y: 1
    osd.window-switcher.style-classic.item.active.border.width: 0
    osd.window-switcher.style-classic.item.active.border.color: #706f6d
    osd.window-switcher.style-classic.item.active.bg.color: #232323
    # The icon size the same as the font size by default
    # osd.window-switcher.style-classic.item.icon.size: 50

    osd.window-switcher.style-thumbnail.width.max: 80%
    osd.window-switcher.style-thumbnail.padding: 5
    osd.window-switcher.style-thumbnail.item.width: 300
    osd.window-switcher.style-thumbnail.item.height: 250
    osd.window-switcher.style-thumbnail.item.padding: 10
    osd.window-switcher.style-thumbnail.item.active.border.width: 0
    osd.window-switcher.style-thumbnail.item.active.border.color: #706f6d
    osd.window-switcher.style-thumbnail.item.active.bg.color: #232323
    osd.window-switcher.style-thumbnail.item.icon.size: 60

    osd.window-switcher.preview.border.width: 1
    osd.window-switcher.preview.border.color: #8DA3B9

    osd.workspace-switcher.boxes.width: 20
    osd.workspace-switcher.boxes.height: 20
    osd.workspace-switcher.boxes.border.width: 1

    # Default values for following options change depending on the rendering
    # backend. For software-based renderers, *.bg.enabled is "no" and
    # *.border.enabled is "yes" if not set. For hardware-based renderers,
    # *.bg.enabled is "yes" and *.border.enabled is "no" if not set.
    # Setting *.bg.enabled to "yes" for software-based renderer with translucent
    # background color may severely impact performance.
    #
    # snapping.overlay.region.bg.enabled:
    # snapping.overlay.edge.bg.enabled:
    # snapping.overlay.region.border.enabled:
    # snapping.overlay.edge.border.enabled:

    snapping.overlay.region.bg.color: #8DA3B980
    snapping.overlay.edge.bg.color: #8DA3B980
    snapping.overlay.region.border.width: 1
    snapping.overlay.edge.border.width: 1
    snapping.overlay.region.border.color: #8DA3B9
    snapping.overlay.edge.border.color: #8DA3B9
  '';
  home.file.".local/share/themes/my-openbox/openbox-3/max.xbm".source = ./icons/max.xbm;
  home.file.".local/share/themes/my-openbox/openbox-3/close.xbm".source = ./icons/close.xbm;
  home.file.".local/share/themes/my-openbox/openbox-3/shade.xbm".source = ./icons/shade.xbm;
}
