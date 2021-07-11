#!/bin/bash

echo "*********************List of domain*****************"
aws route53 list-hosted-zones-by-name | grep Name | tee  /Users/SajjadWasim/Desktop/Doug/5.txt 

aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId, InstanceType:InstanceType, LaunchTime:LaunchTime, Monitoring:Monitoring.State, AZ:Placement.AvailabilityZone, HostName:PrivateDnsName, PrivateIpAddress:PrivateIpAddress, SecurityGroups:SecurityGroups[0].GroupName}' --output table | tee -a  /Users/SajjadWasim/Desktop/Doug/5.txt


aws ec2 describe-volumes --query 'Volumes[*].{ID:VolumeId,InstanceId:Attachments[0].InstanceId,AZ:AvailabilityZone,Size:Size}' --output table | tee -a  /Users/SajjadWasim/Desktop/Doug/5.txt
