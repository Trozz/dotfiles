function fix-apt-keys {
  if [ ! -x /usr/sbin/add-apt-key ]; then
    echo -e Needed add-apt-key util not installed, attempting to fix this...
    sudo apt-get install add-apt-key
  fi
  echo Running apt-get update -q to log unknown keys...
  sudo apt-get update -q 2>&1 | grep -Po -e '\w{16}$' | xargs -d '\n' -n1 sudo add-apt-key
  echo Removing temp file created to run fix-apt-keys...
  rm /tmp/apterr -fv
}
