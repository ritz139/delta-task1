
#Putting the schedule for the task
echo '00 00 * * * sudo bash autoSchedule.sh' > file.txt

#THis will set the cron configuration
sudo crontab file.txt

#This will remove the temp file created
rm -f file.txt
