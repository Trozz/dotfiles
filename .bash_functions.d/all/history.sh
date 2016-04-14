function hgrepl() {
history | sed s/.*\ \ // | grep $@
}
function hgrep() {
history | sed s/.*\ \ // | grep $@ | tail -n 30
}
function hhgrep() {
history | egrep "$@" | egrep -v "hgrep $@"
}
