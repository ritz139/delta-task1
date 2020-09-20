
echo '00 06 * * * sudo bash attendance.sh' > file.txt
sudo crontab file.txt
rm -f file.txt
