{config, stdenv, ...}:
stdenv.mkDerivation {
  src = ./my-theme;
  name = "my-sddm-theme";
  dontUnpack = true;
  installPhase = with config.stylix.base16Scheme; ''
    mkdir -p $out/share/sddm/themes/my-theme
    cp -r $src/* $out/share/sddm/themes/my-theme
    touch $out/share/sddm/themes/my-theme/theme.conf
    cat > $out/share/sddm/themes/my-theme/theme.conf << 'EOL' 
    ## Please see https://github.com/aczw/sddm-theme-corners/blob/main/CONFIG.md for
    ## more information about these options. Happy configuring!
    [General]
    BgSource="${config.myOptions.desktopTheme.sddm.wallpaper}"
    FontFamily="${config.stylix.fonts.sansSerif.name}"
    FontSize=${toString config.stylix.fonts.sizes.applications}
    Padding=50
    Radius=10
    Scale=${toString config.myOptions.desktopTheme.sddm.scale}
    UserPictureEnabled=false
    InputColor="#${base01}"
    InputTextColor="#${base05}"
    InputBorderWidth=2
    InputBorderColor="#${config.stylix.base16Scheme.${config.myOptions.desktopTheme.base16Accent}}"
    UserPlaceholderText="user"
    PassPlaceholderText="password"
    HidePassword=true
    LoginButtonTextColor="#${base05}"
    LoginButtonText="Login"
    LoginButtonColor="#${config.stylix.base16Scheme.${config.myOptions.desktopTheme.base16Accent}}"
    PopupColor="#${base01}"
    PopupActiveColor="#${base02}"
    PopupActiveTextColor="#${base05}"
    SessionButtonColor="#${base01}"
    SessionIconColor="#${base05}"
    PowerButtonColor="#${base01}"
    PowerIconColor="#${base05}"
    DateTimeSpacing=-20
    DateColor="#${base05}"
    DateSize=36
    DateIsBold=false
    DateOpacity=1.0
    DateFormat="dddd, MMMM d"
    TimeColor="#${base05}"
    TimeSize=48
    TimeIsBold=true
    TimeOpacity=1.0
    TimeFormat="hh:mm AP"
    EOL
  '';
}
