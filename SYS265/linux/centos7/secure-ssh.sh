# secure-ssh.sh
# author Mohammed
# You have to run the script from where the script is located at


# Creating user
username=$1
useradd -m -d /home/$1 -s /bin/bash $1
mkdir -p /home/$1/.ssh

# copying SSH keys
touch /home/$1/.ssh/authorized_keys
cat ../public-keys/id_rsa.pub >> /home/$1/.ssh/authorized_keys

# Configuring access settings
chmod 700 /home/$1/.ssh
chmod 600 /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh
chown -R $1:$1 /home/$1

# Disable Root SSH
# Note this will work for both CentOS and Ubuntu

sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
sed -i '/PermitRootLogin/s/yes/no/g' /etc/ssh/sshd_config
systemctl restart ssh
