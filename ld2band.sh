test -e $1
status=$?
a=0
if [ $status -eq $a -a $2 -z '' ]
then
        ps -elyf | awk '{print $2}' | sort | uniq > user
        ps -elyf > $1
        for n in `cat user`
        do
        echo "Naudotojas: " $n
        Rss=0
        ps -elyf | grep $n | awk '{print $8}' | grep \[0-9] > rss
        for m in `cat rss`
        do
        Rss=`expr $Rss + $m`
        done
        Sz=0
        ps -elyf | grep $n | awk '{print $9}' | grep \[0-9] > sz
        for m in `cat sz`
        do
        Sz=`expr $Sz + $m`
        done
        echo "bendras RSS: " $Rss
        echo "bendras Sz: " $Sz
        rez=`expr $Rss \* 100 / $Sz`
        echo "RSS/SZ: $rez% "
        echo "\n"
done
elif [ $status -eq $a ]
then
        echo "Naudotojas: " $2
        Rss=0
        ps -elyf > $1
        ps -elyf | grep $2 | awk '{print $8}' | grep \[0-9] > rss
        for m in `cat rss`
        do
        Rss=`expr $Rss + $m`
done
        Sz=0
        ps -elyf | grep $2 | awk '{print $9}' | grep \[0-9] > sz
        for m in `cat sz`
        do
        Sz=`expr $Sz + $m`
        done
        echo "bendras RSS: " $Rss
        echo "bendras Sz: " $Sz
        rez=`expr $Rss \* 100 / $Sz`
        echo "RSS/SZ: $rez% "
        echo "\n"
else
        for v in $*
        do
        echo "Naudotojas: " $v
        Rss=0
        ps -elyf | grep $v | awk '{print $8}' | grep \[0-9] > rss
        for m in `cat rss`
        do
        Rss=`expr $Rss + $m`
        done
        Sz=0
        ps -elyf | grep $v | awk '{print $9}' | grep \[0-9] > sz
        for m in `cat sz`
        do
        Sz=`expr $Sz + $m`
        done
        echo "bendras RSS: " $Rss
        echo "bendras Sz: " $Sz
        rez=`expr $Rss \* 100 / $Sz`
        rez2=$((8/4))
        echo "RSS/SZ: $rez%"
        echo "\n"
done
fi
