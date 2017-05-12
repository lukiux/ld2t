# ld2t

for v in $*
do
test -d $v || test -e $v
status=$?
a=1
if [ $status -eq $a ]
then echo "failas ar katalogas neegzistuoja"
exit $status
fi


ls -l $v | tail -1 | awk '{print $3}' > savinink
savininkas=`awk '{print$1}' savinink`
echo "$1" savininkas $savininkas

root="root";
if [ $savininkas = "root" ]
then savininkas="root"
fi

echo "$savininkas"
grep $savininkas /etc/passwd | awk -F : '{print $1,$5,$6}' > savinink
chechUser=`awk '{print $5}' savinink`
if [ $savininkas = "root" ]
then
        user=`awk '{print $3}' savinink`
        name=`awk '{print $2}' savinink`
        echo "vardas/pavarde:" $name
        date=`awk '{print $5}' savinink`
        echo "registruotas: informacijos nera"
        home=`awk '{print $6}' savinink`
        echo "namu katalogas:" $user
elif [ $chechUser = "IFU" ]
then
        user=`awk '{print $6}' savinink`
        name=`awk '{print $2,$3,$4}' savinink`
        echo "vardas/pavarde:" $name
        date=`awk '{print $6}' savinink`
        echo "registruotas:" $date
        home=`awk '{print $7}' savinink`
        echo "namu katalogas:" $user
else
        user=`awk '{print $6}' savinink`
        name=`awk '{print $2,$3}' savinink`
        echo "vardas/pavarde:" $name
        date=`awk '{print $5}' savinink`
        echo "registruotas:" $date
        home=`awk '{print $6}' savinink`
        echo "namu katalogas:" $user

fi


if test -x $user
then
        echo "namu katalogo perziura: leidziama\n"
        ls -l $user | sort -k 7 | tail -10 | sort -k 9 | awk '{print $9}'
else
        echo "namu katalogo perziura: draudziama"
fi
echo "\n"
done


