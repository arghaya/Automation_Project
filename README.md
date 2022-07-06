# Automation_Project


Bash script to automate the installation of Apache2 web server and push the logs to S3.

1. Script updates the package information: On execution of the script, it update the package details. ( apt update -y)
2. Script ensures that the HTTP Apache server is installed: Script checks whether the HTTP Apache server is already installed. If not present, then it installs the server
3. Script ensures that HTTP Apache server is running: Script checks whether the server is running or not. If it is not running, then it starts the server
4. Script ensures that HTTP Apache service is enabled: Script ensures that the server runs on restart/reboot, I.e., it checks whether the service is enabled or not. It enables the service if not enabled already
5. Archiving logs to S3: 
     a. After executing the script the tar file should be present in the correct format in the /tmp/ directory
     b. Tar should be copied to the S3 bucket
6. Branching and Tagging: 
     a. Two branches, the main and the Dev, are present in the repository
     b. Correct tags should be found in the Git repository
