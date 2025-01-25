homeDir="/home/$3"
installDir="$homeDir/.local/share/Etterna"
applicationsDir="$homeDir/.local/share/applications"

if [[ -d "$installDir" ]]; then
    rm -rf "$installDir"
    /run/current-system/sw/bin/install -o "$3" "$1/Etterna" "$installDir"
    rm -rf "$installDir/Announcers"
    rm -rf "$installDir/Assets"
    rm -rf "$installDir/NoteSkins"
    rm -rf "$installDir/Songs"
    rm -rf "$installDir/Themes"
else
    echo "\$1: $1"
    echo "\$2: $2"
    echo "\$3: $3"
    /run/current-system/sw/bin/install -o "$3" "$1/Etterna" "$installDir"
    [[ ! -d "$homeDir/.etterna" ]] && {
        mkdir "$homeDir/.etterna"
        mkdir "$homeDir/.etterna/Save"
        mv "$installDir/Announcers" "$homeDir/.etterna"
        mv "$installDir/Assets" "$homeDir/.etterna"
        mv "$installDir/NoteSkins" "$homeDir/.etterna"
        mv "$installDir/Songs" "$homeDir/.etterna"
        mv "$installDir/Themes" "$homeDir/.etterna"
    }
fi

/run/current-system/sw/bin/chown -R "$3" "$installDir"
/run/current-system/sw/bin/chmod -R 755 "$installDir"

/run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Announcers" "$installDir"
/run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Assets" "$installDir"
/run/current-system/sw/bin/ln -sf "$homeDir/.etterna/NoteSkins" "$installDir"
/run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Save" "$installDir"
/run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Songs" "$installDir"
/run/current-system/sw/bin/ln -sf "$homeDir/.etterna/Themes" "$installDir"

[[ -f "$applicationsDir/etterna.desktop" ]] && \
    rm "$applicationsDir/etterna.desktop"

/run/current-system/sw/bin/cp "$2" "$applicationsDir/etterna.desktop"
/run/current-system/sw/bin/chown "$3" "$applicationsDir/etterna.desktop"
/run/current-system/sw/bin/chmod 755 "$applicationsDir/etterna.desktop"
echo "Icon=$homeDir/.local/share/icons/etterna.png" >> "$applicationsDir/etterna.desktop"
echo "Exec=$installDir/Etterna" >> "$applicationsDir/etterna.desktop"

/run/current-system/sw/bin/chown -R "$3:users" "$homeDir/.etterna"
/run/current-system/sw/bin/chmod -R 755 "$homeDir/.etterna"

/run/current-system/sw/bin/chown -R "$3:users" "$installDir"
/run/current-system/sw/bin/chmod -R 755 "$installDir"
/run/current-system/sw/bin/chmod +x "$installDir/Etterna"
