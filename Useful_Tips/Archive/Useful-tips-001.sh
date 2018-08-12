#!/bin/bash

#
###########################################
###	Define Variables
###########################################
#
###	Color Variables [Delete unused variables when done]
#
RED=`tput setaf 1`
YELLOW=`tput setaf 3`
CYAN=`tput setaf 6`
LTRED=`tput setaf 9`
LTYLLW=`tput setaf 11`
LTMAG=`tput setaf 13`
LTCYN=`tput setaf 14`
#
BOLD=`tput bold`
RESET=`tput sgr0`
#
###########################################
###	Define Functions
###########################################
#
function show_opts
{
printf "\n\t $LTCYN $BOLD Options-$RESET $CYAN
  [help]\t Help\t\t  Shows this menu and exits
  [meta]\t Meta Chars\t  Shows ways to remove files with names\n\t\t\t\t  that are meta-characters including\n\t\t\t\t  by-inode number, and a link to the site resourced.
  [expr]\t Expressions\t  Full list and explanation of Conditional\n\t\t\t\t  and Regular Expressions.\n\t\t\t\t  This option requires a 2nd parameter\n\t\t\t\t  The ONLY parameters are one of the following\n\t\t\t\t  'view', 'cat', or a filename. Syntax is as so =>$RESET $LTMAG \n\t    command option [view|cat|<filename.txt>]
\n$RESET
"
}
function rem_meta
{
printf "$LTCYN $BOLD
Removing files with special characters and by inode-$RESET $CYAN
https://www.linux.com/blog/linux-shell-tip-remove-files-names-contains-spaces-and-special-characters-such$RESET $LTMAG
Tip #1: Put filenames in quotes
Tip #3: Try a ./ at the beginning of the filename or absolute path
Tip #4: Try a -- at the beginning of the filename$RESET $YELLOW
Tip #5: Remove file by an inode number
# ls -li$RESET $LTYLLW #Find the inode <nnnnnnn> of the file$RESET $YELLOW
# find . -inum <nnnnnnn> -delete
# find . -inum <nnnnnnn> -exec rm -i {} \;
\n$RESET
"
}
#
function def_expres
{
printf ""$CYAN $BOLD
\n\tYou can find the expressions.txt at -
# wget http://woodbeeco.com/scripts/expressions.txt
or 
# https://github.com/SeaPhor/SeaPhor-Scripts\n
$RESET""
}
#
function lvm_notes
{
printf ""\n$YELLOW
#LVM - Adding a new disk to a existing Volume Group (VG)
#Add new disk with VMware tool.

#Usually, the command “fdisk -l” will not detect the new disk. Execute this command to do rescan the bus: 
#Command: echo "- - -" > /sys/class/scsi_host/host#/scan where # is 0 or 1 or 2
# fdisk -l

#Command: pvcreate /dev/sd<x>
# pvdisplay

#Command: vgextend <VolumeGroupName> <PhysicalDevicePath>
# vgextend system /dev/sd<x>

#Executing pvdisplay again shows the /dev/sdb is now part of VG system:
# pvdisplay
#--- Physical volume ---
#PV Name		/dev/sdb
#VG Name		system
#PV Size		8.00 GiB / not usable 4.00 MiB
#Allocatable		yes
#PE Size		4.00 MiB
#Total PE		2047
#Free PE		2047

#To add via Free PE
# lvextend -l +2047 /dev/system/root

#To Add via amount of GB to add
# lvextend -L+1G /dev/system/root

#To Add via amount of GB to be total size
# lvextend -L12G /dev/system/root

#Command: resize2fs The last step is to resize the logical volume (LV)
# resize2fs /dev/system/root
# df -hl
$RESET ""
}
#
#function add_prefix
#{
# sed 's/^/#\ /' myfile.txt >> myfile-commented.txt
#}
#

case $1 in
  "help")
        show_opts
        exit $?
        ;;
  "meta")
	rem_meta
        exit $?
	;;
  "expr")
	if [[ "`echo $2`" == "" ]]; then
		printf "$LTRED $BOLD \nReview Your Parameters for this option!$RESET"
        	show_opts
		printf "$LTRED $BOLD \nReview Your Parameters for this option!$RESET\n"
        	exit $?
	else
		if [[ "`echo $2`" == "view" ]]; then
			def_expres | less
        		exit $?
		else
			if [[ "`echo $2`" == "cat" ]]; then
				def_expres
        			exit $?
			else
				def_expres >> $2
        			exit $?
			fi
		fi
	fi
	;;
  *)
        show_opts
        exit $?
        ;;
esac
exit $?
# Next steps
## change *all expressions to 'conditional expressions'
#
