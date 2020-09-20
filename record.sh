user=$(whoami)

if [ $1 -ge 1 ] && [ $1 -le 7 ];then

    fulldt=$(date --date 'last sunday')
    today=$(date | awk '{print $1}')

    diff=$(expr $(echo $(date) | awk '{print $2}') - $(echo $fulldt |  awk '{print $2}') )
    if [ $diff -lt 7 ];then
        fulldt=$(date --date '2 weeks ago sunday')
        diff=$(expr $diff + 7)
    fi

    offset=$(expr $diff - $1 )
    targetDate=$(date --date "$offset days ago" -I)

#Getting the attendance data
    cat /home/$user/ChiefCommander/attendance_record | grep $targetDate > query.txt
else
    echo 'Enter Correct number'

fi
