# If not running interactively, don't do anything
[ -z "$PS1" ] && return
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:$HOME/bin:$HOME/.go/bin
#export PATH=$PATH:$HOME/bin:/usr/local/bin/bash

function include_d {
  dir=$1
  if ! lsb_loc="$(type -p "lsb_release")" || [ -z "$lsb_loc" ]; then
    os=$(uname -s)
  else
    os=$(lsb_release -si)
  fi
  if [ -d $HOME/.$dir.d/$os -a -r $HOME/.$dir.d/$os -a -x $HOME/.$dir.d/$os ]; then
    for i in $HOME/.$dir.d/$os/*.sh; do
      . $i
    done
  fi
  if [ -d $HOME/.$dir.d/all -a -r $HOME/.$dir.d/all -a -x $HOME/.$dir.d/all ]; then
    for i in $HOME/.$dir.d/all/*.sh; do
      . $i
    done
  fi
}

include_d bash_functions
include_d bash_aliases
include_d bash_completion
include_d bash_exports
include_d bash_secure

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
