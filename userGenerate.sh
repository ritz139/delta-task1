sudo useradd -m -p $(openssl passwd -1 password) ChiefCommander

sudo useradd -m -p $(openssl passwd -1 password) ArmyGeneral

sudo useradd -m -p $(openssl passwd -1 password) NavyMarshal

sudo useradd -m -p $(openssl passwd -1 password) AirForceChief

count=1

while [ $count -lt 51 ]; do
	name=Army$count
	sudo useradd -m -p $(openssl passwd -1 password) $name

	name=Navy$count
	sudo useradd -m -p $(openssl passwd -1 password) $name

	name=AirForce$count
	sudo useradd -m -p $(openssl passwd -1 password) $name

	count=$((count+1))

done

