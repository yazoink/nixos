homeDir="/home/$3"
installDir="$homeDir/.local/share/Etterna"
applicationsDir="$homeDir/.local/share/applications"

if [[ -d "$installDir/Etterna" ]]; then
  rm -rf "$installDir"
  cp -r "$1/Etterna" "$installDir"
  rm -rf "$installDir/Announcers"
  rm -rf "$installDir/Assets"
  rm -rf "$installDir/NoteSkins"
  rm -rf "$installDir/Songs"
  rm -rf "$installDir/Themes"
else
  echo "\$1: $1"
  echo "\$2: $2"
  echo "\$3: $3"
  cp -r "$1/Etterna" "$installDir"
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

ln -sf "$homeDir/.etterna/Announcers" "$installDir"
ln -sf "$homeDir/.etterna/Assets" "$installDir"
ln -sf "$homeDir/.etterna/NoteSkins" "$installDir"
ln -sf "$homeDir/.etterna/Save" "$installDir"
ln -sf "$homeDir/.etterna/Songs" "$installDir"
ln -sf "$homeDir/.etterna/Themes" "$installDir"

[[ -f "$applicationsDir/etterna.desktop" ]] && \
  rm "$applicationsDir/etterna.desktop"

cp "$2" "$applicationsDir/etterna.desktop"
chown "$3" "$applicationsDir/etterna.desktop"
chmod 755 "$applicationsDir/etterna.desktop"
echo "Icon=$homeDir/.local/share/icons/etterna.png" >> "$applicationsDir/etterna.desktop"
echo "Exec=$installDir/Etterna" >> "$applicationsDir/etterna.desktop"

chown -R "$3:users" "$homeDir/.etterna"
chmod -R 755 "$homeDir/.etterna"

chown -R "$3:users" "$installDir"
chmod -R 755 "$installDir"
chmod +x "$installDir/Etterna"
