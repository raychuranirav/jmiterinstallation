#!/bin/bash

# Check if the user is running the script as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS="$NAME"
else
    echo "Unable to detect the Linux distribution"
    exit 1
fi

# Install JMeter based on the Linux distribution
case "$OS" in
    "Amazon Linux")
        yum update -y
        yum install -y java-1.8.0-openjdk
        wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz
        tar -xvzf apache-jmeter-5.6.3.tgz
        mv apache-jmeter-5.6.3 jmeter
        mv jmeter /opt
        echo 'export PATH="$PATH:/opt/jmeter/bin"' >> ~/.bashrc
        source ~/.bashrc
        ;;
    "Ubuntu")
        apt update
        apt upgrade -y
        apt install -y default-jdk
        wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz
        tar -xvzf apache-jmeter-5.6.3.tgz
        mv apache-jmeter-5.6.3 jmeter
        mv jmeter /opt
        echo 'export PATH="$PATH:/opt/jmeter/bin"' >> ~/.bashrc
        source ~/.bashrc
        ;;
    "CentOS Linux" | "Red Hat Enterprise Linux")
        yum update -y
        yum install -y java-1.8.0-openjdk
        wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz
        tar -xvzf apache-jmeter-5.6.3.tgz
        mv apache-jmeter-5.6.3 jmeter
        mv jmeter /opt
        echo 'export PATH="$PATH:/opt/jmeter/bin"' >> ~/.bashrc
        source ~/.bashrc
        ;;
    "SUSE Linux Enterprise Server")
        zypper update -y
        zypper install -y java-1_8_0-openjdk
        wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz
        tar -xvzf apache-jmeter-5.6.3.tgz
        mv apache-jmeter-5.6.3 jmeter
        mv jmeter /opt
        echo 'export PATH="$PATH:/opt/jmeter/bin"' >> ~/.bashrc
        source ~/.bashrc
        ;;
    "Debian GNU/Linux")
        apt update
        apt upgrade -y
        apt install -y default-jdk
        wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz
        tar -xvzf apache-jmeter-5.6.3.tgz
        mv apache-jmeter-5.6.3 jmeter
        mv jmeter /opt
        echo 'export PATH="$PATH:/opt/jmeter/bin"' >> ~/.bashrc
        source ~/.bashrc
        ;;
    "Fedora")
        dnf update -y
        dnf install -y java-1.8.0-openjdk
        wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz
        tar -xvzf apache-jmeter-5.6.3.tgz
        mv apache-jmeter-5.6.3 jmeter
        mv jmeter /opt
        echo 'export PATH="$PATH:/opt/jmeter/bin"' >> ~/.bashrc
        source ~/.bashrc
        ;;
    *)
        echo "Unsupported Linux distribution: $OS"
        exit 1
        ;;
esac

echo "JMeter installation completed successfully"
