#!/bin/bash

apt-get update
apt-get --assume-yes safe-upgrade
apt-get --assume-yes install apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install --assume-yes docker-ce

curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

grep -q "deployer" /etc/passwd
if [ $? -eq 0 ]
then
echo "User deployer does already exist."
fi

sudo adduser deployer --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
usermod -aG docker deployer

mkdir -p /home/deployer/.ssh
chmod 700 /home/deployer/.ssh
ssh-keygen -t rsa -N '' -f /home/deployer/.ssh/id_rsa
ssh-keygen -Hf /home/deployer/.ssh/known_hosts
cat /home/deployer/.ssh/id_rsa.pub >> /home/deployer/.ssh/known_hosts
chmod 644 /home/deployer/.ssh/known_hosts
chown -R deployer:deployer /home/deployer/.ssh

docker --version
docker-compose --version
docker run hello-world
