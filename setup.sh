#!/bin/bash

# Update the package list
sudo apt-get update

# Install Java 11
sudo apt-get install -y openjdk-11-jre

# Install Docker
sudo apt-get install -y docker.io docker-compose

# Install Python 3 and pip
sudo apt-get install -y python3 python3-pip

# Install Scapy using pip
pip3 install scapy

# Install Wireshark
sudo apt-get install -y wireshark

# Clone Modbuspal repository
git clone https://github.com/CyberWar2O/modbuspal.git

# Clone mbtget repository
git clone https://github.com/CyberWar2O/mbtget.git
cd mbtget
perl Makefile.PL
make
sudo make install
cd ..

# Download PCAP files
mkdir pcaps
cd pcaps
wget https://github.com/CyberWar2O/ICS-Security-Tools/raw/master/pcaps/BACnet/bacnet_test.pcap
wget https://github.com/CyberWar2O/ICS-Security-Tools/raw/master/pcaps/s7/S7Comm/s7comm_clean.pcap
wget https://github.com/CyberWar2O/ICS-Security-Tools/raw/master/pcaps/CIP/cip_only.pcap
wget https://github.com/CyberWar2O/ICS-Security-Tools/raw/master/pcaps/ModbusTCP/ModbusTCP.pcap
cd ..

# Print a message to indicate the installation is complete
echo "Java 11, Docker, Python 3, Scapy, Wireshark, mbtget, and modbuspal have been installed."
