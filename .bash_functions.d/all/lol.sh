function ruler() {
  for s in '....^....|' '1234567890'; do w=${#s}; str=$( for (( i=1; $i<=$(( ($COLUMNS + $w) / $w )) ; i=$i+1 )); do echo -n $s; done ); str=$(echo $str | cut -c -$COLUMNS) ; echo $str; done;
}
