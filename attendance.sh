
update()
{
    echo $record | grep YES 1>/dev/null
    if [ $? = 0 ];then
        val=$(echo $record | sed 's/-06.00.00//' | sed 's/YES/PRESENT/' | awk '{print $1,$2,$3}')
        runuser -l $owner -c "echo $val >> $tmpPath"
    else
        
        val=$(echo $record | sed 's/-06.00.00//' | sed 's/NO/ABSENT/' | awk '{print $1,$2,$3}')
        runuser -l $owner -c "echo $val >> $tmpPath"
    fi
}


cat attendance.log | grep $(date -I) >todaysAttendance

#For the army troops attendance
tmpPath=/home/ArmyGeneral/attendance_record
echo >>$tmpPath
echo >>$tmpPath
echo $(date) >>$tmpPath
for troop in Army{1..50};do
    record=$(cat todaysAttendance | grep "$troop ")
    owner='ArmyGeneral'
    update 

done


#For the Navy  troops attendance
tmpPath=/home/NavyMarshal/attendance_record
echo >>$tmpPath
echo >>$tmpPath
echo $(date)>>$tmpPath
for troop in Navy{1..50};do
    record=$(cat todaysAttendance | grep  "$troop ")
    echo $record | grep YES 1>/dev/null
    owner="NavyMarshal"
    update
done

#For the AirForce  troops attendance
tmpPath=/home/AirForceChief/attendance_record
echo >>$tmpPath
echo >>$tmpPath
echo $(date)>>$tmpPath
for troop in AirForce{1..50};do
    record=$(cat todaysAttendance | grep  "$troop ")
    owner="AirForceChief"
    update
done


rm -f todaysAttendance
