#!/bin/bash
#
# This script is for the bash lab on variables, dynamic data, and user input
# Download the script, do the tasks described in the comments
# Test your script, run it on the production server, screenshot that
# Send your script to your github repo, and submit the URL with screenshot on Blackboard
echo "Run this script as a root. ex. sudo command"
# Get the current hostname using the hostname command and save it in a variable
host1=$(hostname)
# Tell the user what the current hostname is in a human friendly way
echo "Current hostname of the system is $host1"
# Ask for the user's student number using the read command
read -p "Please insert your student number: " studentnumber1 
# Use that to save the desired hostname of pcNNNNNNNNNN in a variable, where NNNNNNNNN is the student number entered by the user
pc="pc"
concatstudentnum=$pc$studentnumber1
# If that hostname is not already in the /etc/hosts file, change the old hostname in that file to the new name using sed or something similar and
#     tell the user you did that
sed -i 's/'$host1'/'$concatstudentnum'/g /etc/hosts'
host2=$(hostname)
# If that hostname is not the current hostname, change it using the hostnamectl command and
if [[ $host2 != $concatstudentnum ]] ;
	then hostnamectl set-hostname $concatstudentnum; fi
#     tell the user you changed the current hostname and they should reboot to make sure the new name takes full effect
echo "Hostname is changed from $host1 to $concatstudentnum"
echo "Please restart the machine to get full effect"
#200440782