function sshadd {
  if [ -z "$1" ]; then
    echo usage: sshadd [user@]hostname
    return
  fi
  ssh-copy-id -i ~/.ssh/id_rsa.pub $1
}
