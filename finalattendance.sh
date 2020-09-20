#FilePath for attendance_record
attFile=/home/ChiefCommander/attendance_report
owner="ChiefCommander" 
runuser -l $owner -c "echo Final Attendance of all the troops > $attFile"

#Merging the attendance files
for general in ArmyGeneral NavyMarshal AirForceChief;do
    runuser -l $owner -c "echo $general troops Attendance >> $attFile"
    runuser -l $owner -c "cat /home/$general/attendance_record >> $attFile"
   runuser -l $owner -c "echo >> $attFile"
   runuser -l $owner -c "echo >> $attFile"
done
