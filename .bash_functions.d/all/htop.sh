function htop {
  if ! lsb_loc="$(type -p "lsb_release")" || [ -z "$lsb_loc" ]; then
    os=$(uname -s)
  else
    os=$(lsb_release -si)
  fi
  if ! htop_loc="$(type -p "$htop")" || [ -z "$htop_loc" ]; then
    if [ $os = "Debian" ]; then
      apt-get install htop
      sudo htop $@
    elif [ $os = "Darwin" ]; then
      brew install htop
      sudo htop $@
    fi
  else
    sudo htop $@
  fi
}
