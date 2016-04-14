## Display a printout of the largest installed packages, useful for when diskspace is low.
function show-largest-packages {
  if [ -z $1 ]; then
      echo 'Usage: show-largest-packages [# pkgs to show]'
      return
  fi
dpkg-query --show --showformat='${Package}\t${Installed-Size}\n' | sort -k 2 -n | grep -v deinstall | awk '{printf "%.3f MB \t %s\n", $2/(1024), $1}' | tail -n $1
}
