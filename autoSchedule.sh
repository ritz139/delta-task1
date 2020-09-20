
cat position.log | grep $(date -I) >todaysPosition.log

#Creating a post_alloted file in each soldiers directory
#and it will be appended with new position
for usr in Army{1..50} Navy{1..50} AirForce{1..50};do
    a=$(cat todaysPosition.log | grep "$usr " | sed 's/-00.00.00//' | awk '{print $1,$3,$4}')
    runuser -l $usr -c "echo $a >>/home/$usr/post_alloted"
done

rm -f todaysPosition.log  
