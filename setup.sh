#!/bin/bash

# ---------------Get list of images--------------------------------------
gcloud compute images list --project windows-sql-cloud --no-standard-images

# ---------------Launch your SQL Server instance on GCE-------------------
gcloud compute instances create [INSTANCE_NAME] \
    --image-project windows-sql-cloud \
    --image-family [IMAGE_FAMILY] \
    --machine-type [MACHINE_TYPE] \
    --boot-disk-size [BOOT_DISK_SIZE] \
    --boot-disk-type [BOOT_DISK_TYPE]

# ---------------Set the firewall rule-------------------------------------
gcloud compute firewall-rules create sql-server-1433 \
--description "Allow SQL Server access from all sources on port 1433." \
--allow tcp:1433 --network [NETWORK]

# --------------Other Info-------------------------------------------------
## set the intial password for your SQL Server instances
## connect via RDP, if using Chrome, there's a plug you can download
## add firewall rule for RDP port (3398)

## RDP to your instances
## (Optional) Install additional SQL Server components
##      -- setup exe at c:\setup.exe
##  (Optional) Add a second persistent disk
##      -- re-run setup and add installation path
## NOTE: You can re-size your disks if needed, even when instance is running

## To add R Language (in-database) service
## Connect to your instance using RDP
## Click on c:\setup.exe --> add R
