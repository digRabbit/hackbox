#!/bin/bash

# A script to install default hunting tools to a Ubuntu 18.04 droplet.
#Wfuzz, nuclei, goLang, SecList, Rockyou.txt, nikto


apt update && apt upgrade -y


# Installing Python
apt install python -y
apt install python-pip -y
apt install python3-pip -y

#Installing goLang
wget -O /tmp/go.tar.gz https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile
source /etc/profile


## Installing WFUZZ
sudo apt install libcurl4-openssl-dev
apt install wfuzz -y


##Installing Nuclei
wget -O /tmp/nuclei.tar.gz https://github.com/projectdiscovery/nuclei/releases/download/v2.1.1/nuclei_2.1.1_linux_amd64.tar.gz
tar -xzvf /tmp/nuclei.tar.gz
mv nuclei /usr/local/bin

#Installing SecList && rockyou.txt
mkdir /wordlists
git clone https://github.com/danielmiessler/SecLists.git /wordlists/
wget -O /wordlists/rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt


## Install nikto
apt install nikto -y

## Install Nmap
apt install nmap -y