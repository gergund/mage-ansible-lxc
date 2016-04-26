#!/bin/bash
yum install -y https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum update -y && yum upgrade -y
yum install -y sudo atop htop sysstat openssh-server
useradd jenkins -m -p <secret password here>
sed -i s/requiretty/\!requiretty/ /etc/sudoers
sed -i "99i jenkins ALL=(ALL)       NOPASSWD: ALL" /etc/sudoers
mkdir -p /home/jenkins/.ssh/ && chown -R jenkins:jenkins /home/jenkins && chmod 700 /home/jenkins/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArUY9XP/UeKBN9eVyiYOFOq/G3BO600UBCtz0VE5GqN/w/9zBkx1vFb/5XVKQPBlQgekYYbxuBmGSpKwk8ZGZoxFgj/H0w61RrdT0dv31XNB/MHIHUb8Ggr0hEedX/T6sEKR0V3639NqPUoOQU0sJNcznLNpis+/nyWGXkHjYh58naDceLwvRfjqKSuQvx0XEX9YSaG3H8IOYzVINxdtt2VDcn9WNe3z8lbO7lBs4Si0zH9fWFlGZgD656wmd5JkK580sAJpI8jr/yaGBP6/FpcPxAkHduqPJ7FRs+xgrNW8teu5U7ZyOnMXUFBIcjX8H7fIYiWtWdHOAYWhbH23wtQ== jenkins@kipling-mgmt01" > /home/jenkins/.ssh/authorized_keys
chmod 600 /home/jenkins/.ssh/authorized_keys
service sshd restart
