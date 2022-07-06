#!/bin/bash


##variables declared 

name="arghaya"
s3_bucket="upgrad-arghaya"
timestamp=$(date '+%d%m%Y-%H%M%S')

## update the repo 
apt update -y


## check if apache2 binary is installed or not if not we will install the package automically
if [[ apache2 != $(dpkg --get-selections apache2 | awk '{print $1}') ]];
then
    apt install apache2 -y
fi


## check if awscli binary is installed or not if not we will install the package automically
if [[ awscli != $(dpkg --get-selections awscli | awk '{print $1}') ]];
then
    apt install awscli -y
fi


## check if the apache2 service is enabled or not if not will enable  the service
apache_service_enabled=$(systemctl is-enabled apache2 | grep "enabled")
if [[ enabled != ${apache_service_enabled} ]];
then
      systemctl enable apache2
fi


## check if the apache service is running or not, if not will start the service 
apache_service_running=$(systemctl status apache2 | grep active | awk '{print $3}' | tr -d '()')
if [[ running != ${apache_service_running} ]];
then
     systemctl start apache2
fi



cd /var/log/apache2
tar -cvzf /tmp/${name}-httpd-logs-${timestamp}.tar *.log

if [[ -f /tmp/${name}-httpd-logs-${timestamp}.tar ]];
then
    aws s3 cp /tmp/${name}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${name}-httpd-logs-${timestamp}.tar
fi
