#!/bin/bash
echo 'this will produce a .ppk key'
mkdir /home/$USER/.ssh
chmod $USER /home/$USER/.ssh
cd ~/.ssh
ssh-keygen -t rsa
puttygen id_rsa -o id_rsa.ppk
echo "a new key for user ${USER} has been produced in the ~/.ssh directory"
string="$(cat id_rsa.pub)"
sudo echo $string >> authorized_keys
sudo apt-get install libpam-google-authenticator
cd ~
#sudo echo 'auth required pam_google_authenticator.so' >> /etc/pam.d/sshd
sudo systemctl restart sshd.service
#sudo sed 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
google-authenticator
#chmod $USER /etc/ssh/sshd_config
#sudo echo 'Match Group dokas' >> /etc/ssh/sshd_config
#sudo echo '	AuthenticationMethods publickey,keyboard-interactive' >> /etc/ssh/sshd_config
