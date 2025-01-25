homeDir="/home/$3"
installDir="$homeDir/.local/share/Etterna"
applicationsDir="$homeDir/.local/share/applications"

# if Etterna dir exists
if [[ -d "$installDir" ]]; then
    echo "$installDir exists"
    # Replace dirs not in .etterna
    rm -rf "$installDir/BackgroundEffects"
    rm -rf "$installDir/BackgroundTransitions"
    rm -rf "$installDir/BGAnimations"
    rm -rf "$installDir/Data"
    rm -rf "$installDir/Scripts"
    /run/current-system/sw/bin/cp -r "$1/Etterna/BackgroundEffects" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/BackgroundTransitions" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/BGAnimations" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/Data" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/Scripts" "$installDir"
else
    echo "$installDir doesn't exist"
    # copy Etterna dir
    mkdir -p "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/Etterna" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/BackgroundEffects" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/BackgroundTransitions" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/BGAnimations" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/Data" "$installDir"
    /run/current-system/sw/bin/cp -r "$1/Etterna/Scripts" "$installDir"

    # if .etterna doesnt exist
    [[ ! -d "$homeDir/.etterna" ]] && {
        # make .etterna dir
        mkdir -p "$homeDir/.etterna"
        mkdir -p "$homeDir/.etterna/Save"
        /run/current-system/sw/bin/cp "$1/Etterna/Announcers" "$homeDir/.etterna"
        /run/current-system/sw/bin/cp "$1/Etterna/Assets" "$homeDir/.etterna"
        /run/current-system/sw/bin/cp "$1/Etterna/NoteSkins" "$homeDir/.etterna"
        /run/current-system/sw/bin/cp "$1/Etterna/Songs" "$homeDir/.etterna"
        /run/current-system/sw/bin/cp "$1/Etterna/Themes" "$homeDir/.etterna"
    }

    # symlink .etterna dirs to Etterna dir
    /run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Announcers" "$installDir"
    /run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Assets" "$installDir"
    /run/current-system/sw/bin/ln -sf "$homeDir/.etterna/NoteSkins" "$installDir"
    /run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Save" "$installDir"
    /run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Songs" "$installDir"
    /run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Themes" "$installDir"
fi


# Copy .desktop file
[[ -f "$applicationsDir/etterna.desktop" ]] && \
    rm "$applicationsDir/etterna.desktop"

/run/current-system/sw/bin/cp "$2" "$applicationsDir/etterna.desktop"
/run/current-system/sw/bin/chown "$3" "$applicationsDir/etterna.desktop"
/run/current-system/sw/bin/chmod 755 "$applicationsDir/etterna.desktop"
echo "Icon=$homeDir/.local/share/icons/etterna.png" >> "$applicationsDir/etterna.desktop"
echo "Exec=$installDir/Etterna" >> "$applicationsDir/etterna.desktop"

# chown/chmod .etterna
/run/current-system/sw/bin/chown -R "$3:users" "$homeDir/.etterna"
/run/current-system/sw/bin/chmod -R 755 "$homeDir/.etterna"

# chown/chmod Etterna
/run/current-system/sw/bin/chown -R "$3:users" "$installDir"
/run/current-system/sw/bin/chmod -R 755 "$installDir"
/run/current-system/sw/bin/chmod +x "$installDir/Etterna"
