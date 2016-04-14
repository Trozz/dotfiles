pskill()
{
        local pid

        pid=$(ps ax | grep $1 | grep -v grep | awk '{ print $1 }')
        echo -n "killing $1 (process $pid)..."
        kill -9 $pid
        echo "Fatality."
}
