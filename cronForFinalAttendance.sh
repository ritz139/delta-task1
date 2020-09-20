
echo "15 06 * * * sudo bash finalattendance.sh" > file
sudo crontab file
rm -f file
