psnice()
{
if [[ -z $1 || -z $2 ]] ; then
echo "Usage: psnice procname [-/+ nice]"
return 1
fi
ps ax | grep $1 | grep -v grep | awk '{ print $1 }' | xargs sudo renice $2 -p
}
