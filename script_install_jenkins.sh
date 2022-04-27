#!/bin/bash

sudo apt install default-jdk git -y

sudo wget -P /tmp https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
sudo tar -xf /tmp/apache-maven-3.8.5-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.8.5 /opt/maven

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo 'export JENKINS_HOME=/var/lib/jenkins' | sudo tee -a /etc/profile.d/maven.sh
echo 'export JAVA_HOME=/usr/lib/jvm/default-java' | sudo tee -a /etc/profile.d/maven.sh
echo 'export M2_HOME=/opt/maven' | sudo tee -a /etc/profile.d/maven.sh
echo 'export MAVEN_HOME=/opt/maven' | sudo tee -a /etc/profile.d/maven.sh
echo 'export PATH=/opt/maven/bin:$PATH' | sudo tee -a /etc/profile.d/maven.sh
source /etc/profile

# echo 'export JENKINS_HOME=/var/lib/jenkins' | sudo tee -a /etc/profile
# echo 'export JAVA_HOME=/usr/lib/jvm/default-java' | sudo tee -a /etc/profile
# echo 'export MAVEN_HOME=/opt/maven' | sudo tee -a /etc/profile
# echo 'export GIT_HOME=/usr/bin/git' | sudo tee -a /etc/profile

# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
# sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# chmod +r /var/lib/jenkins/secrets/initialAdminPassword
# sudo cp /var/lib/jenkins/secrets/initialAdminPassword /home/ubuntu
