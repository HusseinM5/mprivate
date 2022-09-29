username=$1
useradd $1
mkdir -p /home/$1/.ssh

touch /home/$1/.ssh/authorized_keys
cat ../public-keys/id_rsa.pub >> /home/$1/.ssh/authorized_keys

sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
sed -i '/PermitRootLogin/s/yes/no/g' /etc/ssh/sshd_config
