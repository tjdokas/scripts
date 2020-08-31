#!/bin/bash
#this script should be run on initial installation of ubuntu ot configure the nodes

#this should be run as root

apt-get update && apt-get -y upgrade && apt-get autoremove

apt-get install net-tools && apt-get install openssh-server && apt-get install putty-tools

groupadd -g 202 dokas
adduser tjdokas dokas
