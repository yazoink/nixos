homeDir="/home/$3"
installDir="$homeDir/.local/share/Etterna"
applicationsDir="$homeDir/.local/share/applications"

if [[ ! -f "$installDir/Etterna" ]]; then
  echo "\$1: $1"
  echo "\$2: $2"
  echo "\$3: $3"
  cp -r "$1/Etterna" "$installDir"
  mkdir "$homeDir/.etterna"
  mkdir "$homeDir/.etterna/Save"
  mv "$installDir/Announcers" "$homeDir/.etterna"
  mv "$installDir/Assets" "$homeDir/.etterna"
  mv "$installDir/NoteSkins" "$homeDir/.etterna"
  mv "$installDir/Songs" "$homeDir/.etterna"
  mv "$installDir/Themes" "$homeDir/.etterna"
else
  rm -rf "$installDir"
  cp -r "$1/Etterna" "$installDir"
  rm -rf "$installDir/Announcers"
  rm -rf "$installDir/Assets"
  rm -rf "$installDir/NoteSkins"
  rm -rf "$installDir/Songs"
  rm -rf "$installDir/Themes"
fi

ln -s "$homeDir/.etterna/Announcers" "$installDir"
ln -s "$homeDir/.etterna/Assets" "$installDir"
ln -s "$homeDir/.etterna/NoteSkins" "$installDir"
ln -s "$homeDir/.etterna/Save" "$installDir"
ln -s "$homeDir/.etterna/Songs" "$installDir"
ln -s "$homeDir/.etterna/Themes" "$installDir"

if [[ -f "$applicationsDir/etterna.desktop" ]]; then
  rm "$applicationsDir/etterna.desktop"
fi

cp "$2" "$applicationsDir/etterna.desktop"
chown "$3" "$applicationsDir/etterna.desktop"
chmod 755 "$applicationsDir/etterna.desktop"
echo "Icon=$homeDir/.local/share/icons/etterna.png" >> "$applicationsDir/etterna.desktop"
echo "Exec=$installDir/Etterna" >> "$applicationsDir/etterna.desktop"

chown -R "$3":users "$homeDir/.etterna"
chmod -R 755 "$homeDir/.etterna"

mkdir "$installDir/Cache"
chown -R "$3":users "$installDir/Cache"
chmod -R 755 "$installDir/Cache"
chmod -R 755 "$installDir/Etterna"
