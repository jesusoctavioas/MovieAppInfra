#! /bin/bash 

sudo apt-get install ansible sshpass -y
ssh-keygen -t rsa -b 2048 -f /home/vagrant/.ssh/id_rsa -q -N ''
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chmod 644 /home/vagrant/.ssh/id_rsa.pub
chmod 600 /home/vagrant/.ssh/id_rsa /home/vagrant/.ssh/authorized_keys
