#!/bin/bash
echo 'this script should be run as root'
echo 'auth required pam_google_authenticator.so' >> /etc/pam.d/sshd
sed 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
chmod $USER /etc/ssh/sshd_config
echo 'Match Group dokas' >> /etc/ssh/sshd_config
echo '    AuthenticationMethods publickey,keyboard-interactive' >> /etc/ssh/sshd_config
ufw allow 22
ufw enable
