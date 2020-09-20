user=$(whoami)

sudo chown -R ChiefCommander:$user /home/ChiefCommander

for grp in ArmyGeneral NavyMarshal AirForceChief;do
   sudo usermod -a -G $grp ChiefCommander
done



#This allows the ChiefCommander to access all the troop leaders directories
for grp in ArmyGeneral NavyMarshal AirForceChief; do
    sudo chown -R $grp:ChiefCommander /home/$grp
    sudo chmod -R g+rwx /home/$grp
    sudo chmod -R g+s /home/$grp 
    sudo chmod 770 /home/$grp
done


for usr in Army{1..50};do
    sudo chown -R $usr:ArmyGeneral /home/$usr
    sudo chmod -R g+rwx /home/$usr
    sudo chmod -R g+s /home/$usr
    sudo chmod 770 /home/$usr
done


for usr in Navy{1..50};do
    sudo chown -R $usr:NavyMarshal /home/$usr
    sudo chmod -R g+rwx /home/$usr
    sudo chmod -R g+s /home/$usr
    sudo chmod 770 /home/$usr
done


for usr in AirForce{1..50};do
    sudo chown -R $usr:AirForceChief /home/$usr
    sudo chmod -R g+rwx /home/$usr
    sudo chmod -R g+s /home/$usr
    sudo chmod 770 /home/$usr
done
