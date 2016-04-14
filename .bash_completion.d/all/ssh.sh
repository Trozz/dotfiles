if [[ -e $HOME/.ssh/known_hosts ]]; then
complete -o default -W "$(cat $HOME/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi
