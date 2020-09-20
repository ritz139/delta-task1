echo "30 06 * * * sudo bash nearest.sh" > file
sudo crontab file
rm -f file
