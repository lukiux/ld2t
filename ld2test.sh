for v in $*
do
test -f $v || test -d $v
status=$?
a=1
if [ $status -eq $a ]
then
echo "failas ar katalogas neegzistuoja!"
exit $status
fi

ls -l $v | tail -1 | awk '{print $3}'  > savinink
savininkas=`cat savinink`
echo "$v" $savininkas
grep $savininkas /etc/passwd | awk -F : '{print $5,$6}' > savinink
chechUser=`awk '{print $4}' savinink`
if [ $savininkas = "root" ]
then
        user=`awk '{print $1}' savinink`
        echo "vardas/pavarde:" $user
        echo "registruotas: informacijos nera"
        home=`awk '{print $2}' savinink`
        echo "namu katalogas:" $home

elif [ $chechUser = "IFU" ]
then
        user=`awk '{print $1,$2,$3}' savinink`
        echo "vardas/pavarde:" $user
        data=`awk '{print $5}' savinink`
        echo "registruotas:" $data
        home=`awk '{print $6}' savinink`
        echo "namu katalogas:" $home
else
        user=`awk '{print $1,$2}' savinink`
        echo "vardas/pavarde:" $user
        data=`awk '{print $4}' savinink`
        echo "registruotas:" $data
        home=`awk '{print $5}' savinink`
        echo "namu katalogas:" $home
fi

if test -x $home
        then
                echo "namu katalogo perziura: leidziama"
                ls -l $home | sort -k 6 | tail -10 | awk '{print $9}' | sort
        else
                echo "namu katalogo perziura: draudziama"

        fi
echo "\n"

done
