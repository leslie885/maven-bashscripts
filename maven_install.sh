#! /bin/bash

# Update system packages
sudo yum update -y

# Install necessary tools and dependencies

cd /opt
sudo yum install wget nano tree unzip git-all java-11-openjdk-devel java-1.8.0-openjdk-devel -y

# Download Maven
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip

# Unzip, rename, and remove the zip file
sudo unzip apache-maven-3.9.6-bin.zip
sudo rm -f apache-maven-3.9.6-bin.zip
sudo mv apache-maven-3.9.6 /opt/maven

# Set environment for one user variables in ~/.bash_profile
echo "export M2_HOME=/opt/maven" >> ~/.bash_profile
echo "export PATH=\$PATH:\$M2_HOME/bin" >> ~/.bash_profile

# Source the profile to apply changes
source ~/.bash_profile

# Print Maven version
mvn -v
